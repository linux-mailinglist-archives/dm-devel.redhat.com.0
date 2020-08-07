Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1032823F16A
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 18:44:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-WvHFzt1DM0qDZHxz3zCPHg-1; Fri, 07 Aug 2020 12:43:57 -0400
X-MC-Unique: WvHFzt1DM0qDZHxz3zCPHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B23C61005510;
	Fri,  7 Aug 2020 16:43:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B259C65C7F;
	Fri,  7 Aug 2020 16:43:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E6291809554;
	Fri,  7 Aug 2020 16:43:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 077GffVx007587 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 12:41:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10F72218ADC2; Fri,  7 Aug 2020 16:41:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6530217B43A
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 16:41:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 920AA8A19BE
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 16:41:38 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-370-JE0jBdHVNvi9ad_7uG3NPA-1;
	Fri, 07 Aug 2020 12:41:28 -0400
X-MC-Unique: JE0jBdHVNvi9ad_7uG3NPA-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 077Gf5ki013063;
	Fri, 7 Aug 2020 16:41:05 GMT
Date: Sat, 8 Aug 2020 02:41:05 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Mimi Zohar <zohar@linux.ibm.com>
In-Reply-To: <eb7a2f5b5cd22cf9231aa0fd8fdb77c729a83428.camel@linux.ibm.com>
Message-ID: <alpine.LRH.2.21.2008080240350.13040@namei.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2020, Mimi Zohar wrote:

> On Thu, 2020-08-06 at 09:51 +1000, James Morris wrote:
> > On Wed, 5 Aug 2020, Mimi Zohar wrote:
> > 
> > > If block layer integrity was enough, there wouldn't have been a need
> > > for fs-verity.   Even fs-verity is limited to read only filesystems,
> > > which makes validating file integrity so much easier.  From the
> > > beginning, we've said that fs-verity signatures should be included in
> > > the measurement list.  (I thought someone signed on to add that support
> > > to IMA, but have not yet seen anything.)
> > > 
> > > Going forward I see a lot of what we've accomplished being incorporated
> > > into the filesystems.  When IMA will be limited to defining a system
> > > wide policy, I'll have completed my job.
> > 
> > What are your thoughts on IPE being a standalone LSM? Would you prefer to 
> > see its functionality integrated into IMA?
> 
> Improving the integrity subsystem would be preferred.
> 

Are you planning to attend Plumbers? Perhaps we could propose a BoF 
session on this topic.

-- 
James Morris
<jmorris@namei.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

