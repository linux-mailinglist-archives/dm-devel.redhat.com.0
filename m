Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1042BBC26
	for <lists+dm-devel@lfdr.de>; Sat, 21 Nov 2020 03:21:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-FB3DNqzcMHymSnR6-xONAA-1; Fri, 20 Nov 2020 21:21:02 -0500
X-MC-Unique: FB3DNqzcMHymSnR6-xONAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 690631856A64;
	Sat, 21 Nov 2020 02:20:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33BE013470;
	Sat, 21 Nov 2020 02:20:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93E4A180954D;
	Sat, 21 Nov 2020 02:20:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AL2KKG3015321 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 21:20:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D178110E60E7; Sat, 21 Nov 2020 02:20:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD84F10E60E6
	for <dm-devel@redhat.com>; Sat, 21 Nov 2020 02:20:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 908DE811E76
	for <dm-devel@redhat.com>; Sat, 21 Nov 2020 02:20:18 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-72-V0n4B2EFPvmTpMhfLJCAyw-1;
	Fri, 20 Nov 2020 21:20:16 -0500
X-MC-Unique: V0n4B2EFPvmTpMhfLJCAyw-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 0AL25Nup018866;
	Sat, 21 Nov 2020 02:05:23 GMT
Date: Sat, 21 Nov 2020 13:05:23 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
In-Reply-To: <20201119232611.30114-9-tusharsu@linux.microsoft.com>
Message-ID: <alpine.LRH.2.21.2011211301340.18334@namei.org>
References: <20201119232611.30114-1-tusharsu@linux.microsoft.com>
	<20201119232611.30114-9-tusharsu@linux.microsoft.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, paul@paul-moore.com, snitzer@redhat.com,
	selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
	linux-kernel@vger.kernel.org, zohar@linux.ibm.com,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, casey@schaufler-ca.com,
	linux-integrity@vger.kernel.org, dm-devel@redhat.com,
	gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v6 8/8] selinux: measure state and hash of
 the policy using IMA
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

On Thu, 19 Nov 2020, Tushar Sugandhi wrote:

> an impact on the security guarantees provided by SELinux. Measuring
> such in-memory data structures through IMA subsystem provides a secure
> way for a remote attestation service to know the state of the system
> and also the runtime changes in the state of the system.

I think we need better clarity on the security model here than just "a 
secure way...".  Secure how and against what threats?

This looks to me like configuration assurance, i.e. you just want to know 
that systems have been configured correctly, not to detect a competent 
attack. Is that correct?



-- 
James Morris
<jmorris@namei.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

