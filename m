Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 94BC5244532
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:06:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-A7hpwPCEN5Sdgsi5isGqVA-1; Fri, 14 Aug 2020 03:06:14 -0400
X-MC-Unique: A7hpwPCEN5Sdgsi5isGqVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF9E110082E8;
	Fri, 14 Aug 2020 07:06:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B83C560C87;
	Fri, 14 Aug 2020 07:06:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41FCB4EE15;
	Fri, 14 Aug 2020 07:06:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CDuURV021081 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 09:56:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59207217B43B; Wed, 12 Aug 2020 13:56:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 468882144B35
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 13:56:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC27B805B0E
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 13:56:26 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-126-h5CaweuUPa2uYxFVJAzt1g-1; Wed, 12 Aug 2020 09:56:21 -0400
X-MC-Unique: h5CaweuUPa2uYxFVJAzt1g-1
Received: by mail-il1-f193.google.com with SMTP id y18so1652844ilp.10;
	Wed, 12 Aug 2020 06:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=L10aSxHQCG16LTPX2VDKvrZoq6RMS4QxZCBViQUa0lE=;
	b=Bc2sAhMEL6kZ8UijkoUD5UDUZfF6jQd6JI5oAF97pLskLEsNveFJ/hJEgguz4E/dDx
	TPv3Gl4UUyFeV1o3YA3T259nOHeTjK7h51pqFoRvQYkc+KRwM9YFjUU528U/5SLU7ndM
	zy+lfUNnukCvVEsF7XbyXzC0WcIYG6IUUdjX4rs7Cg1CK+NYB9Fl31urrfZi6v4HwJ2P
	vybLPXAOwnT4Fp4RTB+6yCMeBr7ky8DNtgGpbirRt4NvwRHlnGWvARqNkLCqXRqMSBCt
	y1/UAF/VXbisTkpkBGltz8tax94pP0+vcBf40Jxhswh9coVlNG/g0xVRgHftOHbWdk88
	bRjQ==
X-Gm-Message-State: AOAM531CjMjaDAslp59r8JYml2qEsMAszUmfsy9YD8QLKydc2PhJ/zeR
	wwRDgPTHxoMb0EMgKheQvqw=
X-Google-Smtp-Source: ABdhPJx/cW3b6ZCypx93XUp2fbLhIViYbxQNo1qPh97cr/CWUQguPl3jz7RLGcshibVycc8x8OWdVg==
X-Received: by 2002:a92:9adc:: with SMTP id c89mr6878133ill.272.1597240580818; 
	Wed, 12 Aug 2020 06:56:20 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id
	u62sm1117047ilc.87.2020.08.12.06.56.18
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2020 06:56:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <1597170509.4325.55.camel@HansenPartnership.com>
Date: Wed, 12 Aug 2020 09:56:17 -0400
Message-Id: <2CA41152-6445-4716-B5EE-2D14E5C59368@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
	<da6f54d0438ee3d3903b2c75fcfbeb0afdf92dc2.camel@linux.ibm.com>
	<1597073737.3966.12.camel@HansenPartnership.com>
	<6E907A22-02CC-42DD-B3CD-11D304F3A1A8@gmail.com>
	<1597124623.30793.14.camel@HansenPartnership.com>
	<16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
	<1597170509.4325.55.camel@HansenPartnership.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CDuURV021081
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>,
	Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
	James Morris <jmorris@namei.org>, nramas@linux.microsoft.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 11, 2020, at 2:28 PM, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
>> Mimi's earlier point is that any IMA metadata format that involves
>> unsigned digests is exposed to an alteration attack at rest or in
>> transit, thus will not provide a robust end-to-end integrity
>> guarantee.
> 
> I don't believe that is Mimi's point, because it's mostly not correct:
> the xattr mechanism does provide this today.  The point is the
> mechanism we use for storing IMA hashes and signatures today is xattrs
> because they have robust security properties for local filesystems that
> the kernel enforces.  This use goes beyond IMA, selinux labels for
> instance use this property as well.

I don't buy this for a second. If storing a security label in a
local xattr is so secure, we wouldn't have any need for EVM.


> What I think you're saying is that NFS can't provide the robust
> security for xattrs we've been relying on, so you need some other
> mechanism for storing them.

For NFS, there's a network traversal which is an attack surface.

A local xattr can be attacked as well: a device or bus malfunction
can corrupt the content of an xattr, or a privileged user can modify
it.

How does that metadata get from the software provider to the end
user? It's got to go over a network, stored in various ways, some
of which will not be trusted. To attain an unbroken chain of
provenance, that metadata has to be signed.

I don't think the question is the storage mechanism, but rather the
protection mechanism. Signing the metadata protects it in all of
these cases.


> I think Mimi's other point is actually that IMA uses a flat hash which
> we derive by reading the entire file and then watching for mutations. 
> Since you cannot guarantee we get notice of mutation with NFS, the
> entire IMA mechanism can't really be applied in its current form and we
> have to resort to chunk at a time verifications that a Merkel tree
> would provide.

I'm not sure what you mean by this. An NFS client relies on notification
of mutation to maintain the integrity of its cache of NFS file content,
and it's done that since the 1980s.

In addition to examining a file's mtime and ctime as maintained by
the NFS server, a client can rely on the file's NFSv4 change attribute
or an NFSv4 delegation.


> Doesn't this make moot any thinking about
> standardisation in NFS for the current IMA flat hash mechanism because
> we simply can't use it ... If I were to construct a prototype I'd have
> to work out and securely cache the hash of ever chunk when verifying
> the flat hash so I could recheck on every chunk read.  I think that's
> infeasible for large files.
> 
> James
> 

--
Chuck Lever
chucklever@gmail.com




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

