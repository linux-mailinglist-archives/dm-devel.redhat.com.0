Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DF04A244528
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:04:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-SW7xeq7tPS-3Dr6ydbpBgg-1; Fri, 14 Aug 2020 03:04:38 -0400
X-MC-Unique: SW7xeq7tPS-3Dr6ydbpBgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58A3984635B;
	Fri, 14 Aug 2020 07:04:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8230600E4;
	Fri, 14 Aug 2020 07:04:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C23C04EE14;
	Fri, 14 Aug 2020 07:04:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CEItXZ023178 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 10:18:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 941BE2156A2E; Wed, 12 Aug 2020 14:18:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A00C2156709
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 14:18:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78EB718A6663
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 14:18:50 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-321-Nc5fMAbSOfuSTyIvLDMGNQ-1; Wed, 12 Aug 2020 10:18:45 -0400
X-MC-Unique: Nc5fMAbSOfuSTyIvLDMGNQ-1
Received: by mail-il1-f195.google.com with SMTP id c6so1730287ilo.13;
	Wed, 12 Aug 2020 07:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=48IsAeauuq9BcWaKpHbdNQ/tldBG5RElnWagtcAUqV4=;
	b=DqWoP014kmbxikDIgYh438d7j4x18/iggHqkR6rbtM27we1YD1t6dNI70plgc/SGSu
	/AaGhjUgY0fpujwgqq19Mfsu2Ex5YAKc8qnfwv/JgYLFuX68oBIa7ut346m58UKlRE4s
	WFunxKZfd7PsGGTGctIGPnsLgitge56DHqN3WJnIqgsbVea2Jn8tvPunuCGQSvudjMzh
	08Pn/Yk+VObXSpGiaOboxZG0tVSYfkccrwKFngcZ0GavMX2DCrAJ6mNPh0EY4kdQFZC2
	+Ec4erwuC41ZPxG+6ZUDRELc99VZ8g3LljrHybDwPsk6im52ehuN0gzKmM5sobhbuVx2
	G8zA==
X-Gm-Message-State: AOAM531FHxWsS+h0JZixIgJQCjxDN5w67Ju/KkSBYSAwDwa2nUSc18Ny
	IFC6bsev+ONDuwkOALRSRWc=
X-Google-Smtp-Source: ABdhPJzf/jasvT0zc9p1+CGDgqywSS+wUi9D5ewUAR1wjx5vZ+7v7igbj00P+ikLT5qiFiGJ2YZ2iA==
X-Received: by 2002:a92:418b:: with SMTP id
	o133mr14743047ila.277.1597241924157; 
	Wed, 12 Aug 2020 07:18:44 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id r8sm1129252ilt.54.2020.08.12.07.18.41
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2020 07:18:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <alpine.LRH.2.21.2008120643370.10591@namei.org>
Date: Wed, 12 Aug 2020 10:18:41 -0400
Message-Id: <70603A4E-A548-4ECB-97D4-D3102CE77701@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
	<alpine.LRH.2.21.2008120643370.10591@namei.org>
To: James Morris <jmorris@namei.org>
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
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, Paul Moore <paul@paul-moore.com>,
	Jonathan Corbet <corbet@lwn.net>, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com,
	Jann Horn <jannh@google.com>, linux-block@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	mdsakib@microsoft.com, open list <linux-kernel@vger.kernel.org>,
	eparis@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
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
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 11, 2020, at 5:03 PM, James Morris <jmorris@namei.org> wrote:
> 
> On Sat, 8 Aug 2020, Chuck Lever wrote:
> 
>> My interest is in code integrity enforcement for executables stored
>> in NFS files.
>> 
>> My struggle with IPE is that due to its dependence on dm-verity, it
>> does not seem to able to protect content that is stored separately
>> from its execution environment and accessed via a file access
>> protocol (FUSE, SMB, NFS, etc).
> 
> It's not dependent on DM-Verity, that's just one possible integrity 
> verification mechanism, and one of two supported in this initial 
> version. The other is 'boot_verified' for a verified or otherwise trusted 
> rootfs. Future versions will support FS-Verity, at least.
> 
> IPE was designed to be extensible in this way, with a strong separation of 
> mechanism and policy.

I got that, but it looked to me like the whole system relied on having
access to the block device under the filesystem. That's not possible
for a remote filesystem like Ceph or NFS.

I'm happy to take a closer look if someone can point me the right way.


--
Chuck Lever
chucklever@gmail.com



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

