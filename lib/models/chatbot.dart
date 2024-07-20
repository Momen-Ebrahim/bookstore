class Chatbot {
  String? event;
  String? taskId;
  String? id;
  String? messageId;
  String? conversationId;
  String? mode;
  String? answer;
  Metadata? metadata;
  int? createdAt;

  Chatbot(
      {this.event,
      this.taskId,
      this.id,
      this.messageId,
      this.conversationId,
      this.mode,
      this.answer,
      this.metadata,
      this.createdAt});

  Chatbot.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    taskId = json['task_id'];
    id = json['id'];
    messageId = json['message_id'];
    conversationId = json['conversation_id'];
    mode = json['mode'];
    answer = json['answer'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    data['task_id'] = this.taskId;
    data['id'] = this.id;
    data['message_id'] = this.messageId;
    data['conversation_id'] = this.conversationId;
    data['mode'] = this.mode;
    data['answer'] = this.answer;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Metadata {
  Usage? usage;

  Metadata({this.usage});

  Metadata.fromJson(Map<String, dynamic> json) {
    usage = json['usage'] != null ? new Usage.fromJson(json['usage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usage != null) {
      data['usage'] = this.usage!.toJson();
    }
    return data;
  }
}

class Usage {
  int? promptTokens;
  String? promptUnitPrice;
  String? promptPriceUnit;
  String? promptPrice;
  int? completionTokens;
  String? completionUnitPrice;
  String? completionPriceUnit;
  String? completionPrice;
  int? totalTokens;
  String? totalPrice;
  String? currency;
  double? latency;

  Usage(
      {this.promptTokens,
      this.promptUnitPrice,
      this.promptPriceUnit,
      this.promptPrice,
      this.completionTokens,
      this.completionUnitPrice,
      this.completionPriceUnit,
      this.completionPrice,
      this.totalTokens,
      this.totalPrice,
      this.currency,
      this.latency});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    promptUnitPrice = json['prompt_unit_price'];
    promptPriceUnit = json['prompt_price_unit'];
    promptPrice = json['prompt_price'];
    completionTokens = json['completion_tokens'];
    completionUnitPrice = json['completion_unit_price'];
    completionPriceUnit = json['completion_price_unit'];
    completionPrice = json['completion_price'];
    totalTokens = json['total_tokens'];
    totalPrice = json['total_price'];
    currency = json['currency'];
    latency = json['latency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prompt_tokens'] = this.promptTokens;
    data['prompt_unit_price'] = this.promptUnitPrice;
    data['prompt_price_unit'] = this.promptPriceUnit;
    data['prompt_price'] = this.promptPrice;
    data['completion_tokens'] = this.completionTokens;
    data['completion_unit_price'] = this.completionUnitPrice;
    data['completion_price_unit'] = this.completionPriceUnit;
    data['completion_price'] = this.completionPrice;
    data['total_tokens'] = this.totalTokens;
    data['total_price'] = this.totalPrice;
    data['currency'] = this.currency;
    data['latency'] = this.latency;
    return data;
  }
}
