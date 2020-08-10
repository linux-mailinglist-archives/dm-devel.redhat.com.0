Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBD12411B8
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 22:30:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-aL0c9aoLPtqjRlFqDaizfA-1; Mon, 10 Aug 2020 16:30:29 -0400
X-MC-Unique: aL0c9aoLPtqjRlFqDaizfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7982D106B207;
	Mon, 10 Aug 2020 20:30:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72BED10013C2;
	Mon, 10 Aug 2020 20:30:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36E9C18095FF;
	Mon, 10 Aug 2020 20:30:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AKTqYS017318 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 16:29:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80C31208DD84; Mon, 10 Aug 2020 20:29:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A085208DD81
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 20:29:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B07B805B00
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 20:29:49 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-295-xHGrPmLWNoWhNCvQl7CbtQ-1;
	Mon, 10 Aug 2020 16:29:41 -0400
X-MC-Unique: xHGrPmLWNoWhNCvQl7CbtQ-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 07AKTHpc002600;
	Mon, 10 Aug 2020 20:29:17 GMT
Date: Tue, 11 Aug 2020 06:29:17 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Mimi Zohar <zohar@linux.ibm.com>
In-Reply-To: <268edec96cbe7d2626c9158b806e8865b6b1b8ed.camel@linux.ibm.com>
Message-ID: <alpine.LRH.2.21.2008110628260.792@namei.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<alpine.LRH.2.21.2008060949410.20084@namei.org>
	<eb7a2f5b5cd22cf9231aa0fd8fdb77c729a83428.camel@linux.ibm.com>
	<alpine.LRH.2.21.2008080240350.13040@namei.org>
	<4a764c86a824a4b931dd7f130ce7afce7df140e4.camel@linux.ibm.com>
	<268edec96cbe7d2626c9158b806e8865b6b1b8ed.camel@linux.ibm.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, paul@paul-moore.com,
	corbet@lwn.net, nramas@linux.microsoft.com, serge@hallyn.com,
	pasha.tatashin@soleen.com, jannh@google.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 7 Aug 2020, Mimi Zohar wrote:

> > > Are you planning to attend Plumbers? Perhaps we could propose a BoF 
> > > session on this topic.
> > 
> > That sounds like a good idea.
> 
> Other than it is already sold out.

Mimi advised me off-list that she is able to attend, so I've submitted a 
BoF proposal:

https://www.linuxplumbersconf.org/event/7/abstracts/732/


-- 
James Morris
<jmorris@namei.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

