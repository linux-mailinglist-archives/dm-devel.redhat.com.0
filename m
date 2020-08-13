Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 368AE243BC3
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 16:43:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-HzidMjUaPdGwpAVSZ9cXEg-1; Thu, 13 Aug 2020 10:43:56 -0400
X-MC-Unique: HzidMjUaPdGwpAVSZ9cXEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 982C4800D53;
	Thu, 13 Aug 2020 14:43:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C29E614F6;
	Thu, 13 Aug 2020 14:43:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A5FC4EE16;
	Thu, 13 Aug 2020 14:43:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DEgx6Z020263 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 10:42:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1BF7E47CD8; Thu, 13 Aug 2020 14:42:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16ED847CE8
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 14:42:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C2E805C0E
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 14:42:56 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-464-VhzQAAnaN8OoiC9AMEIvFQ-1;
	Thu, 13 Aug 2020 10:42:53 -0400
X-MC-Unique: VhzQAAnaN8OoiC9AMEIvFQ-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C45B78EE1E5; 
	Thu, 13 Aug 2020 07:42:45 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TBsBb6x-NfcO; Thu, 13 Aug 2020 07:42:45 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
	[73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3D9208EE0F8;
	Thu, 13 Aug 2020 07:42:44 -0700 (PDT)
Message-ID: <1597329763.3708.13.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Chuck Lever <chucklever@gmail.com>
Date: Thu, 13 Aug 2020 07:42:43 -0700
In-Reply-To: <3F328A12-25DD-418B-A7D0-64DA09236E1C@gmail.com>
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
	<2CA41152-6445-4716-B5EE-2D14E5C59368@gmail.com>
	<1597246946.7293.9.camel@HansenPartnership.com>
	<3F328A12-25DD-418B-A7D0-64DA09236E1C@gmail.com>
Mime-Version: 1.0
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
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>, Paul,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>,
	Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-13 at 10:21 -0400, Chuck Lever wrote:
> > On Aug 12, 2020, at 11:42 AM, James Bottomley <James.Bottomley@Hans
> > enPartnership.com> wrote:
[...]
> > For most people the security mechanism of local xattrs is
> > sufficient.  If you're paranoid, you don't believe it is and you
> > use EVM.
> 
> When IMA metadata happens to be stored in local filesystems in
> a trusted xattr, it's going to enjoy the protection you describe
> without needing the addition of a cryptographic signature.
> 
> However, that metadata doesn't live its whole life there. It
> can reside in a tar file, it can cross a network, it can live
> on a back-up tape. I think we agree that any time that metadata
> is in transit or at rest outside of a Linux local filesystem, it
> is exposed.
> 
> Thus I'm interested in a metadata protection mechanism that does
> not rely on the security characteristics of a particular storage
> container. For me, a cryptographic signature fits that bill
> nicely.

Sure, but one of the points about IMA is a separation of mechanism from
policy.  Signed hashes (called appraisal in IMA terms) is just one
policy you can decide to require or not or even make it conditional on
other things.

> > > > I think Mimi's other point is actually that IMA uses a flat
> > > > hash which we derive by reading the entire file and then
> > > > watching for mutations. Since you cannot guarantee we get
> > > > notice of mutation with NFS, the entire IMA mechanism can't
> > > > really be applied in its current form and we have to resort to
> > > > chunk at a time verifications that a Merkel tree would provide.
> > > 
> > > I'm not sure what you mean by this. An NFS client relies on
> > > notification of mutation to maintain the integrity of its cache
> > > of NFS file content, and it's done that since the 1980s.
> > 
> > Mutation detection is part of the current IMA security model.  If
> > IMA sees a file mutate it has to be rehashed the next time it
> > passes the gate.  If we can't trust the NFS server, we can't trust
> > the NFS mutation notification and we have to have a different
> > mechanism to check the file.
> 
> When an NFS server lies about mtime and ctime, then NFS is completely
> broken. Untrusted NFS server doesn't mean "broken behavior" -- I
> would think that local filesystems will have the same problem if
> they can't trust a local block device to store filesystem metadata
> like indirect blocks and timestamps.
> 
> It's not clear to me that IMA as currently implemented can protect
> against broken storage devices or incorrect filesystem behavior.

IMA doesn't really care about the storage.  The gate check will fail if
the storage corrupts the file because the hashes won't match.  The
mechanism for modification notification is the province of the
filesystem and there are definitely some which don't do it (or other fs
features) correctly and thus can't use IMA.

> > > In addition to examining a file's mtime and ctime as maintained
> > > by the NFS server, a client can rely on the file's NFSv4 change
> > > attribute or an NFSv4 delegation.
> > 
> > And that's secure in the face of a malicious or compromised server?
> > 
> > The bottom line is still, I think we can't use linear hashes with
> > an open/exec/mmap gate with NFS and we have to move to chunk at a
> > time verification like that provided by a merkel tree.
> 
> That's fine until we claim that remote filesystems require one form
> of metadata and local filesystems use some other form.
> 
> To guarantee an unbroken chain of provenance, everyone has to use the
> same portable metadata format that is signed once by the content
> creator. That's essentially why I believe the Merkle-based metadata
> format must require that the tree root is signed.

Well, no, that would be optional policy.  We should certainly support
signed head hashes and require it if the policy said so, but we
shouldn't enforce it without the policy.

Suppose I'm a cloud service provider exporting files over NFS on the
control (private) network.  I use IMA to measure untrusted tenants to
get a feel for what they're doing, but since I control the NFS server,
the client and the private network, I wouldn't feel the requirement to
have signed hashes because I trust other mechanisms for the security.

James

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

