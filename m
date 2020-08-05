Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0225723CDC3
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 19:50:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-I4UwgDS8N5CVMwZgb9E_cw-1; Wed, 05 Aug 2020 13:50:48 -0400
X-MC-Unique: I4UwgDS8N5CVMwZgb9E_cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 193D41923763;
	Wed,  5 Aug 2020 17:50:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B590D87A47;
	Wed,  5 Aug 2020 17:50:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10C961809554;
	Wed,  5 Aug 2020 17:50:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075HoCx2026269 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 13:50:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7EC1D3325D; Wed,  5 Aug 2020 17:50:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A7D3F49C9
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 17:50:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61C131859163
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 17:50:10 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-357-Lfm_SC8VOtiJRAqIfEkA2g-1;
	Wed, 05 Aug 2020 13:50:05 -0400
X-MC-Unique: Lfm_SC8VOtiJRAqIfEkA2g-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 075Gxe6x030131;
	Wed, 5 Aug 2020 16:59:42 GMT
Date: Wed, 5 Aug 2020 09:59:40 -0700 (PDT)
From: James Morris <jmorris@namei.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
In-Reply-To: <1596639689.3457.17.camel@HansenPartnership.com>
Message-ID: <alpine.LRH.2.21.2008050934060.28225@namei.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>,
	paul@paul-moore.com, corbet@lwn.net, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, mdsakib@microsoft.com,
	linux-kernel@vger.kernel.org, eparis@redhat.com,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
 LSM (IPE)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 5 Aug 2020, James Bottomley wrote:

> I'll leave Mimi to answer, but really this is exactly the question that
> should have been asked before writing IPE.  However, since we have the
> cart before the horse, let me break the above down into two specific
> questions.

The question is valid and it was asked. We decided to first prototype what 
we needed and then evaluate if it should be integrated with IMA. We 
discussed this plan in person with Mimi (at LSS-NA in 2019), and presented 
a more mature version of IPE to LSS-NA in 2020, with the expectation that 
such a discussion may come up (it did not).

These patches are still part of this process and 'RFC' status.

>    1. Could we implement IPE in IMA (as in would extensions to IMA cover
>       everything).  I think the answers above indicate this is a "yes".

It could be done, if needed.

>    2. Should we extend IMA to implement it?  This is really whether from a
>       usability standpoint two seperate LSMs would make sense to cover the
>       different use cases.

One issue here is that IMA is fundamentally a measurement & appraisal 
scheme which has been extended to include integrity enforcement. IPE was 
designed from scratch to only perform integrity enforcement. As such, it 
is a cleaner design -- "do one thing and do it well" is a good design 
pattern.

In our use-case, we utilize _both_ IMA and IPE, for attestation and code 
integrity respectively. It is useful to be able to separate these 
concepts. They really are different:

- Code integrity enforcement ensures that code running locally is of known 
provenance and has not been modified prior to execution.

- Attestation is about measuring the health of a system and having that 
measurement validated by a remote system. (Local attestation is useless).

I'm not sure there is value in continuing to shoe-horn both of these into 
IMA.


>  I've got to say the least attractive thing
>       about separation is the fact that you now both have a policy parser.
>        You've tried to differentiate yours by making it more Kconfig
>       based, but policy has a way of becoming user space supplied because
>       the distros hate config options, so I think you're going to end up
>       with a policy parser very like IMAs.


-- 
James Morris
<jmorris@namei.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

