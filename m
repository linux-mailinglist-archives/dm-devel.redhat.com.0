Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 56EEF1AD661
	for <lists+dm-devel@lfdr.de>; Fri, 17 Apr 2020 08:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587105859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dKYeVN8woqUZhy9NkMRALYr63+HoOxAf7HbE0aJVD5U=;
	b=UGF/ZueFzZbv/HjbcETlcOxV0QfWwLzNBoD/NfreQhIu3nM1LLRdrk2OheQUTFsYVOFlB5
	myptolF2qYZr2wZMf6IU0yVIII8oLnaoYhN87c9N0C3zmzR25yqrwy6igKytXOEoMZlmud
	G/f8GzYxDqvcsS3nr02zFB20o7a0mZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-EBrdXmMfOXC5XQE8o4ZBmA-1; Fri, 17 Apr 2020 02:44:16 -0400
X-MC-Unique: EBrdXmMfOXC5XQE8o4ZBmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A7D88017FC;
	Fri, 17 Apr 2020 06:44:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5B8C60BE0;
	Fri, 17 Apr 2020 06:44:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15F3A18089C8;
	Fri, 17 Apr 2020 06:44:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03H0keQg016185 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 20:46:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E7541006B05; Fri, 17 Apr 2020 00:46:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ADC8100724D
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 00:46:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 443438FF67F
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 00:46:37 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-59-0Qe5gqHkMAeC8g4n1m1Elw-1;
	Thu, 16 Apr 2020 20:46:34 -0400
X-MC-Unique: 0Qe5gqHkMAeC8g4n1m1Elw-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id AE0E62072958;
	Thu, 16 Apr 2020 17:46:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AE0E62072958
To: Milan Broz <gmazyland@gmail.com>, linux-integrity@vger.kernel.org,
	zohar@linux.ibm.com, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, dm-devel@redhat.com
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
	<76a9556d-b141-d26f-7b3c-3887d3a4ae16@gmail.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <c76e89f4-6f39-f2f0-6459-a723df67c75f@linux.microsoft.com>
Date: Thu, 16 Apr 2020 17:46:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <76a9556d-b141-d26f-7b3c-3887d3a4ae16@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03H0keQg016185
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 17 Apr 2020 02:43:50 -0400
Cc: sashal@kernel.org, nramas@linux.microsoft.com, jmorris@namei.org,
	chpebeni@linux.microsoft.com, suredd@microsoft.com, balajib@microsoft.com
Subject: Re: [dm-devel] [RFC] IMA: New IMA measurements for dm-crypt and
	selinux
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 2020-04-08 9:28 a.m., Milan Broz wrote:
> On 08/04/2020 12:19, Tushar Sugandhi wrote:
<snip>
>> Proposal:
>> ---------
>> A. Measuring dmcrypt constructs:
>>       We can add an IMA hook in crypt_ctr() present in
>>       drivers/md/dm-crypt.c, so that IMA can start measuring the status of
>>       various dm-crypt targets (represented by crypt_target struct - also
>>       defined in dm-crypt.c).
> 
> Hi,
> 
> I do not think you should just cherry-pick dm-crypt here. What about other
> device-mapper targets? Apparently, dm-verity or dm-integrity are obvious
> candidates too.
> 
> But device-mapper logic is based on stacking devices, so in generic case
> (not just in some very special embedded configuration) you need to measure
> the whole stack of devices.
> (Just imagine a target stacked below dm-crypt that decrypts the device or so. :-)
> 
> Moreover, dm-crypt allows some specific actions like wiping and reloading
> of the encryption key through device-mapper dm-crypt message.
> If you check parameter only in crypt_ctr, this message path must be disabled,
> basically crippling dm-crypt functionality (it is intended to wipe key in-memory
> during hw suspend).
> 
> 
> IMO if you want implement something like IMA measurement, I think you should
> implement it in device-mapper core, and provide support for all targets.
I agree that this needs to be implemented in device-mapper core,
rather than highter applications like  dm-crypt, dm-verity, or dm-integrity.
Functions like dm_table_create(), dm_table_destroy(), 
dm_table_verify_integrity(),
dm_table_complete(), dm_table_add_target() etc. in drivers/md/dm-table.c 
look like good
candidates to add hooks for IMA.
Please let me know if you have any other recommendations.
> I guess some new target specific callback is needed and some flags that
> could enforce/disable stacking if a IMA measurement is in place etc.
> 
> Milan
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

