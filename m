Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB04D2F687A
	for <lists+dm-devel@lfdr.de>; Thu, 14 Jan 2021 18:58:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-BgbWVXinOrCAr7gfRTkK5Q-1; Thu, 14 Jan 2021 12:58:14 -0500
X-MC-Unique: BgbWVXinOrCAr7gfRTkK5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE660107ACF7;
	Thu, 14 Jan 2021 17:58:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5103D648A1;
	Thu, 14 Jan 2021 17:58:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 897A14A7C6;
	Thu, 14 Jan 2021 17:57:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EHvg0i017557 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 12:57:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70D622026D14; Thu, 14 Jan 2021 17:57:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0472026D12
	for <dm-devel@redhat.com>; Thu, 14 Jan 2021 17:57:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59F2A800296
	for <dm-devel@redhat.com>; Thu, 14 Jan 2021 17:57:35 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-284-_s-VSsOaNM2xZj1yqVZ6KQ-1;
	Thu, 14 Jan 2021 12:57:31 -0500
X-MC-Unique: _s-VSsOaNM2xZj1yqVZ6KQ-1
Received: from [192.168.86.31] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id D7E4720B6C40;
	Thu, 14 Jan 2021 09:57:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D7E4720B6C40
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, paul@paul-moore.com
References: <20210108040708.8389-1-tusharsu@linux.microsoft.com>
	<20210108040708.8389-6-tusharsu@linux.microsoft.com>
	<73a82dff7be151298f51c0db6f3c4996ccf44a19.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <3105b0b9-4e74-691c-56ab-6ca183cb2038@linux.microsoft.com>
Date: Thu, 14 Jan 2021 09:57:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <73a82dff7be151298f51c0db6f3c4996ccf44a19.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v10 5/8] IMA: limit critical data measurement
 based on a label
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"



On 2021-01-13 6:09 p.m., Mimi Zohar wrote:
> On Thu, 2021-01-07 at 20:07 -0800, Tushar Sugandhi wrote:
>> Integrity critical data may belong to a single subsystem or it may
>> arise from cross subsystem interaction.  Currently there is no mechanism
>> to group or limit the data based on certain label.  Limiting and
>> grouping critical data based on a label would make it flexible and
>> configurable to measure.
>>
>> Define "label:=", a new IMA policy condition, for the IMA func
>> CRITICAL_DATA to allow grouping and limiting measurement of integrity
>> critical data.
>>
>> Limit the measurement to the labels that are specified in the IMA
>> policy - CRITICAL_DATA+"label:=".  If "label:=" is not provided with
>> the func CRITICAL_DATA, measure all the input integrity critical data.
>>
>> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
>> Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> 
> This is looking a lot better.
> 
> thanks,
> 
> Mimi
> 
Thanks a lot for the feedback Mimi.
Appreciate it. :)

~Tushar

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

