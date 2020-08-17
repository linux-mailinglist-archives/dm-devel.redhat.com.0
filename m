Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBB524871C
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 16:17:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-yn47PGJBM-2WTZIFjeFcrw-1; Tue, 18 Aug 2020 10:17:33 -0400
X-MC-Unique: yn47PGJBM-2WTZIFjeFcrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9F8481F025;
	Tue, 18 Aug 2020 14:17:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93B7A10013C4;
	Tue, 18 Aug 2020 14:17:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C990181A06B;
	Tue, 18 Aug 2020 14:17:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HMRYs1018462 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 18:27:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 520672166BCC; Mon, 17 Aug 2020 22:27:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DAF62166BB3
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 22:27:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41ED118AE954
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 22:27:32 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-336-4elETXDiNESI-zb8D1I9Lg-1;
	Mon, 17 Aug 2020 18:27:30 -0400
X-MC-Unique: 4elETXDiNESI-zb8D1I9Lg-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9703220B4908;
	Mon, 17 Aug 2020 15:27:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9703220B4908
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, gmazyland@gmail.com
References: <20200812193102.18636-1-tusharsu@linux.microsoft.com>
	<20200812193102.18636-3-tusharsu@linux.microsoft.com>
	<591b5f09c7df8ef0378866eaf3afde7a7cb4e82f.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <5275268e-2ce8-0129-b11d-8419ac384262@linux.microsoft.com>
Date: Mon, 17 Aug 2020 15:27:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <591b5f09c7df8ef0378866eaf3afde7a7cb4e82f.camel@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Aug 2020 10:17:04 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 2/3] IMA: add policy to support measuring
 critical data from kernel components
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 2020-08-17 1:43 p.m., Mimi Zohar wrote:
> On Wed, 2020-08-12 at 12:31 -0700, Tushar Sugandhi wrote:
>> There would be several candidate kernel components suitable for IMA
>> measurement. Not all of them would be enlightened for IMA measurement.
>> Also, system administrators may not want to measure data for all of
>> them, even when they are enlightened for IMA measurements. An IMA policy
>> specific to various kernel components is needed to measure their
>> respective critical data.
>>
>> Add a new IMA policy CRITICAL_DATA+data_sources to support measuring
>> various critical kernel components. This policy would enable the
>> system administrators to limit the measurement to the components,
>> if the components are enlightened for IMA measurement.
> 
> "enlightened", really?  Please find a different term, maybe something
> like "supported".
Thanks for the feedback Mimi. Will do.
> 
> Before posting a patch set, please look at the patches line by line,
> like anyone reviewing the code needs to do.  Please minimize code
> change.   Unnecessary formatting changes are unacceptible.   For
> example, like the "#define", below, or in 3/3 the
Thanks for the feedback Mimi.
We extensively reviewed the patches internally before submitting for
upstream review.
We believed adding an extra tab was necessary so that all the previous
values were aligned with the new one - #define IMA_DATA_SOURCES.
We can certainly revert back to only IMA_DATA_SOURCES to have an extra
tab.
> "process_buffer_measurement()" change from void to int.
> 
This was also intentional, and was reviewed internally.
The feedback was we should let the consumers of
process_buffer_measurement() decide whether to use the return
value or not. With void, we are not giving them any choice.

> scripts/Lindent isn't as prevalent as it used to be, but it's still
> included in Documentation/process/coding-style.rst.  Use it as a guide.
Thanks for the pointer. We'll use scripts/Lindent going forward.
> 
> Mimi
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

