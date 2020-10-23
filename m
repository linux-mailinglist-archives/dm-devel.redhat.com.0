Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3A6D298750
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 08:20:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-YZf_wbC5OQCt0Y6fe8aX2g-1; Mon, 26 Oct 2020 03:20:38 -0400
X-MC-Unique: YZf_wbC5OQCt0Y6fe8aX2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 078B057209;
	Mon, 26 Oct 2020 07:20:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8F105D9E8;
	Mon, 26 Oct 2020 07:20:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 934C492F29;
	Mon, 26 Oct 2020 07:20:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09NMcN7G005603 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Oct 2020 18:38:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81A0983631; Fri, 23 Oct 2020 22:38:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C6F083630
	for <dm-devel@redhat.com>; Fri, 23 Oct 2020 22:38:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1249C858287
	for <dm-devel@redhat.com>; Fri, 23 Oct 2020 22:38:21 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-294-etJ6sISeOGiwZA-G28JKdg-1;
	Fri, 23 Oct 2020 18:38:16 -0400
X-MC-Unique: etJ6sISeOGiwZA-G28JKdg-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8447220B4905;
	Fri, 23 Oct 2020 15:38:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8447220B4905
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
References: <20200923192011.5293-1-tusharsu@linux.microsoft.com>
	<20200923192011.5293-2-tusharsu@linux.microsoft.com>
	<45aae09df5c301497efc697c17921e9b2a3c8ae8.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <71db5ccf-c9b3-68b0-4d48-93e2b1ba0d98@linux.microsoft.com>
Date: Fri, 23 Oct 2020 15:38:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <45aae09df5c301497efc697c17921e9b2a3c8ae8.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 26 Oct 2020 03:19:18 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v4 1/6] IMA: generalize keyring specific
 measurement constructs
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Thanks Mimi for your overall feedback on this series.
Really appreciate it.

On 2020-10-22 12:39 p.m., Mimi Zohar wrote:
> Hi Tushar,
> 
> On Wed, 2020-09-23 at 12:20 -0700, Tushar Sugandhi wrote:
> 
>> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
>> index fe1df373c113..31a772d8a86b 100644
>> --- a/security/integrity/ima/ima_policy.c
>> +++ b/security/integrity/ima/ima_policy.c
>> @@ -451,15 +451,19 @@ int ima_lsm_policy_change(struct notifier_block *nb, unsigned long event,
>>   }
>>   
>>   /**
>> - * ima_match_keyring - determine whether the keyring matches the measure rule
>> - * @rule: a pointer to a rule
>> - * @keyring: name of the keyring to match against the measure rule
>> + * ima_match_rule_data - determine whether the given func_data matches
>> + *			 the measure rule data
>> + * @rule: IMA policy rule
>> + * @opt_list: rule data to match func_data against
>> + * @func_data: data to match against the measure rule data
>>    * @cred: a pointer to a credentials structure for user validation
>>    *
>> - * Returns true if keyring matches one in the rule, false otherwise.
>> + * Returns true if func_data matches one in the rule, false otherwise.
>>    */
>> -static bool ima_match_keyring(struct ima_rule_entry *rule,
>> -			      const char *keyring, const struct cred *cred)
>> +static bool ima_match_rule_data(struct ima_rule_entry *rule,
>> +				const struct ima_rule_opt_list *opt_list,
>> +				const char *func_data,
>> +				const struct cred *cred)
>>   {
>>   	bool matched = false;
>>   	size_t i;
>> @@ -467,14 +471,14 @@ static bool ima_match_keyring(struct ima_rule_entry *rule,
>>   	if ((rule->flags & IMA_UID) && !rule->uid_op(cred->uid, rule->uid))
>>   		return false;
>>   
>> -	if (!rule->keyrings)
>> +	if (!opt_list)
>>   		return true;
> 
> The opt_list should be based on rule->func.  There shouldn't be a need
> to pass it as a variable.
> 
> Mimi
Makes sense. Will do. Thanks Mimi.
~Tushar
> 
>>   
>> -	if (!keyring)
>> +	if (!func_data)
>>   		return false;
>>   
>> -	for (i = 0; i < rule->keyrings->count; i++) {
>> -		if (!strcmp(rule->keyrings->items[i], keyring)) {
>> +	for (i = 0; i < opt_list->count; i++) {
>> +		if (!strcmp(opt_list->items[i], func_data)) {
>>   			matched = true;
>>   			break;
>>   		}

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

