Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D89E32EB432
	for <lists+dm-devel@lfdr.de>; Tue,  5 Jan 2021 21:30:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-NuoXJBaRO9eSTgv2pwwBiQ-1; Tue, 05 Jan 2021 15:30:48 -0500
X-MC-Unique: NuoXJBaRO9eSTgv2pwwBiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B78C8049C2;
	Tue,  5 Jan 2021 20:30:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6D1F1001281;
	Tue,  5 Jan 2021 20:30:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CAE5180954D;
	Tue,  5 Jan 2021 20:30:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 105KUcpu019250 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 15:30:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E46059457D; Tue,  5 Jan 2021 20:30:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC568A4C2
	for <dm-devel@redhat.com>; Tue,  5 Jan 2021 20:30:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 719BE858281
	for <dm-devel@redhat.com>; Tue,  5 Jan 2021 20:30:35 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-573-uUKNBjILPomRzVNd-b5p0w-1;
	Tue, 05 Jan 2021 15:30:30 -0500
X-MC-Unique: uUKNBjILPomRzVNd-b5p0w-1
Received: from [192.168.86.31] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id D4EFD20B7192;
	Tue,  5 Jan 2021 12:30:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D4EFD20B7192
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, paul@paul-moore.com
References: <20201212180251.9943-1-tusharsu@linux.microsoft.com>
	<20201212180251.9943-8-tusharsu@linux.microsoft.com>
	<93dc6912192df78026f8f98c8f6ab67608c188f0.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <aefe90e1-c133-fb5a-0e08-1d68fd950731@linux.microsoft.com>
Date: Tue, 5 Jan 2021 12:30:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <93dc6912192df78026f8f98c8f6ab67608c188f0.camel@linux.ibm.com>
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
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v9 7/8] IMA: define a builtin critical data
 measurement policy
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"



On 2020-12-24 6:41 a.m., Mimi Zohar wrote:
> On Sat, 2020-12-12 at 10:02 -0800, Tushar Sugandhi wrote:
>> From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>
>> Define a new critical data builtin policy to allow measuring
>> early kernel integrity critical data before a custom IMA policy
>> is loaded.
>>
>> Add critical data to built-in IMA rules if the kernel command line
>> contains "ima_policy=critical_data".
> 
> This sentence isn't really necessary.
> 
Will remove.
>>
>> Update the documentation on kernel parameters to document
>> the new critical data builtin policy.
>>
>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> 
> Otherwise,
> Reviewed-by:  Mimi Zohar <zohar@linux.ibm.com>
Thanks again for the "Reviewed-by" tag.

Thanks,
Tushar
> 
> thanks,
> 
> Mimi
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

