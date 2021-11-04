Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8A445792
	for <lists+dm-devel@lfdr.de>; Thu,  4 Nov 2021 17:51:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-y2CevLY_MVSgodMy-CthnQ-1; Thu, 04 Nov 2021 12:51:02 -0400
X-MC-Unique: y2CevLY_MVSgodMy-CthnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E1588066F9;
	Thu,  4 Nov 2021 16:50:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19DD619C79;
	Thu,  4 Nov 2021 16:50:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 286EA1801241;
	Thu,  4 Nov 2021 16:50:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A4GoGlb031654 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 12:50:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCC2040C1252; Thu,  4 Nov 2021 16:50:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B87F34035780
	for <dm-devel@redhat.com>; Thu,  4 Nov 2021 16:50:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F9EE811621
	for <dm-devel@redhat.com>; Thu,  4 Nov 2021 16:50:16 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-580-51oGhJQrPTe4lIn7GZolOQ-1;
	Thu, 04 Nov 2021 12:50:12 -0400
X-MC-Unique: 51oGhJQrPTe4lIn7GZolOQ-1
Received: from [10.137.106.139] (unknown [131.107.159.11])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5488920ABA8A;
	Thu,  4 Nov 2021 09:50:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5488920ABA8A
Message-ID: <99aaf850-21d6-5f8c-0cf1-6c7390b8ceea@linux.microsoft.com>
Date: Thu, 4 Nov 2021 09:50:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
	Thunderbird/91.2.1
To: Roberto Sassu <roberto.sassu@huawei.com>, "corbet@lwn.net"
	<corbet@lwn.net>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "agk@redhat.com" <agk@redhat.com>, 
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>,
	"tytso@mit.edu" <tytso@mit.edu>, "paul@paul-moore.com"
	<paul@paul-moore.com>, "eparis@redhat.com" <eparis@redhat.com>,
	"jmorris@namei.org" <jmorris@namei.org>, "serge@hallyn.com"
	<serge@hallyn.com>
References: <1634151995-16266-1-git-send-email-deven.desai@linux.microsoft.com>
	<1634151995-16266-5-git-send-email-deven.desai@linux.microsoft.com>
	<601a323495b745f0a060e67f03af2337@huawei.com>
From: Deven Bowers <deven.desai@linux.microsoft.com>
In-Reply-To: <601a323495b745f0a060e67f03af2337@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: "linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"jannh@google.com" <jannh@google.com>,
	"linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	"linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>
Subject: Re: [dm-devel] [RFC PATCH v7 04/16] ipe: add userspace interface
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 11/3/2021 2:42 AM, Roberto Sassu wrote:
>>
>> +
>> +/**
>> + * ipe_init_securityfs: Initialize IPE's securityfs tree at fsinit
>> + *
>> + * Return:
>> + * !0 - Error
>> + * 0 - OK
>> + */
>> +static int __init ipe_init_securityfs(void)
>> +{
>> +	int rc = 0;
>> +	struct ipe_context *ctx = NULL;
>> +
>> +	ctx = ipe_current_ctx();
> Hi Deven
>
> the instruction above should be executed only if IPE LSM is
> enabled. Otherwise, the kernel panics due to the illegal access
> to the security blob of the task.

I see. I mistakenly assumed that failure in the LSM init would cause
a kernel panic (as the system is now booting without a potentially
required security component) as opposed to just disabling the LSM
and emitting a warning.

Easy fix for v8.

Thanks for pointing it out.


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

