Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A033D692B0B
	for <lists+dm-devel@lfdr.de>; Sat, 11 Feb 2023 00:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676071338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NfXXFlCmEwyTdusmDlRabm2qIFOmhIfZdSTtYA8bihk=;
	b=Lk4hVHpuqSLMSuHTBywaKnsDWTcuyfLDlwjPLZJWJF7CoIxZBErn6yPJxyEbhLfA+b/W2a
	AdGiXgSeyv5bg+L0ujTIZVBpoBV0VBo/c+o+lN+GD5amGzH8U94je0mC91LFR/1t33/Ae5
	UCStI0nKVhdTFoQSQsKjvH8DPmsPX3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-2ibQMWLBPGWwH3Eu6bE9mQ-1; Fri, 10 Feb 2023 18:22:15 -0500
X-MC-Unique: 2ibQMWLBPGWwH3Eu6bE9mQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59F1C85D183;
	Fri, 10 Feb 2023 23:22:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36B0E1121315;
	Fri, 10 Feb 2023 23:22:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07AA919465A8;
	Fri, 10 Feb 2023 23:22:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59CA71946595
 for <dm-devel@listman.corp.redhat.com>; Fri, 10 Feb 2023 23:21:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C1A21410F36; Fri, 10 Feb 2023 23:21:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 345E3140EBF4
 for <dm-devel@redhat.com>; Fri, 10 Feb 2023 23:21:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 173873C1068B
 for <dm-devel@redhat.com>; Fri, 10 Feb 2023 23:21:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-661-z6XYjHh_OxiRTy1sVTNaNg-1; Fri,
 10 Feb 2023 18:21:55 -0500
X-MC-Unique: z6XYjHh_OxiRTy1sVTNaNg-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 0D21520C8B19; Fri, 10 Feb 2023 15:21:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0D21520C8B19
Date: Fri, 10 Feb 2023 15:21:54 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Message-ID: <20230210232154.GA17962@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-4-git-send-email-wufan@linux.microsoft.com>
 <061df661004a06ef1e8790d48157c7ba4ecfc009.camel@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <061df661004a06ef1e8790d48157c7ba4ecfc009.camel@huaweicloud.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [RFC PATCH v9 03/16] ipe: add evaluation loop and
 introduce 'boot_verified' as a trust provider
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 paul@paul-moore.com, dm-devel@redhat.com, corbet@lwn.net,
 roberto.sassu@huawei.com, Deven Bowers <deven.desai@linux.microsoft.com>,
 linux-doc@vger.kernel.org, snitzer@kernel.org, jmorris@namei.org,
 zohar@linux.ibm.com, linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 04:49:44PM +0100, Roberto Sassu wrote:
> On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> > From: Deven Bowers <deven.desai@linux.microsoft.com>
> > 
> > IPE must have a centralized function to evaluate incoming callers
> > against IPE's policy. This iteration of the policy against the rules
> > for that specific caller is known as the evaluation loop.
> 
> Not sure if you check the properties at every access.
> 
> >From my previous comments (also for previous versions of the patches)
> you could evaluate the property once, by calling the respective
> functions in the other subsystems.
> 
> Then, you reserve space in the security blob for inodes and superblocks
> to cache the decision. The format could be a policy sequence number, to
> ensure that the cache is valid only for the current policy, and a bit
> for every hook you enforce.

Thanks for raising this idea. I agree that if the property evaluation
leads to a performance issue, it will be better to cache the evaluation
result. But for this version, all the property evaluations are simple,
so it is just as fast as accessing a cache. Also, for the initial
version we prefer to keep the patch as minimal as possible. 

If the policy evolved to be super complex and the evaluation becomes
a bottleneck, cache support will absolutely be the right way we will go.
-Fan

> 
> Also, currently you rely on the fact that the properties you defined
> are immutable and the immutability is guaranteed by the other
> subsystems, so no write can occur.
> 
> But if you remove this limitation, the immutability is not guaranteed
> anymore by the other subsystems (for example if a file is in an ext4
> filesystem), the LSM needs to take extra care to ensure that the
> properties are still verified. This would be required for example if
> IPE is used in conjuction with DIGLIM.
> 
> In my opinion, IPE value would increase if the generic enforcement
> mechanism is property-agnostic.
> 
> Roberto
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

