Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CC341242C43
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 17:43:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-F4uZo8zXOUGWUjlgGGMV8A-1; Wed, 12 Aug 2020 11:43:18 -0400
X-MC-Unique: F4uZo8zXOUGWUjlgGGMV8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01B3D85B684;
	Wed, 12 Aug 2020 15:43:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F8555DA7B;
	Wed, 12 Aug 2020 15:43:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9E809A025;
	Wed, 12 Aug 2020 15:42:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CFgldB000619 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 11:42:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2458694641; Wed, 12 Aug 2020 15:42:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1169B9463A
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 15:42:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58C4C101A525
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 15:42:44 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-457-Jri5R_rVORaldSTuz5YQHA-1;
	Wed, 12 Aug 2020 11:42:35 -0400
X-MC-Unique: Jri5R_rVORaldSTuz5YQHA-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7E6238EE1DD; 
	Wed, 12 Aug 2020 08:42:29 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AHFsU6pG-8oB; Wed, 12 Aug 2020 08:42:29 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
	[73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 11FF68EE0C7;
	Wed, 12 Aug 2020 08:42:28 -0700 (PDT)
Message-ID: <1597246946.7293.9.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Chuck Lever <chucklever@gmail.com>
Date: Wed, 12 Aug 2020 08:42:26 -0700
In-Reply-To: <2CA41152-6445-4716-B5EE-2D14E5C59368@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-12 at 09:56 -0400, Chuck Lever wrote:
> > On Aug 11, 2020, at 2:28 PM, James Bottomley <James.Bottomley@Hanse
> > nPartnership.com> wrote:
> > 
> > On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
> > > Mimi's earlier point is that any IMA metadata format that
> > > involves unsigned digests is exposed to an alteration attack at
> > > rest or in transit, thus will not provide a robust end-to-end
> > > integrity guarantee.
> > 
> > I don't believe that is Mimi's point, because it's mostly not
> > correct: the xattr mechanism does provide this today.  The point is
> > the mechanism we use for storing IMA hashes and signatures today is
> > xattrs because they have robust security properties for local
> > filesystems that the kernel enforces.  This use goes beyond IMA,
> > selinux labels for instance use this property as well.
> 
> I don't buy this for a second. If storing a security label in a
> local xattr is so secure, we wouldn't have any need for EVM.

What don't you buy?  Security xattrs can only be updated by local root.
 If you trust local root, the xattr mechanism is fine ... it's the only
one a lot of LSMs use, for instance.  If you don't trust local root or
worry about offline backups, you use EVM.  A thing isn't secure or
insecure, it depends on the threat model.  However, if you don't trust
the NFS server it doesn't matter whether you do or don't trust local
root, you can't believe the contents of the xattr.

> > What I think you're saying is that NFS can't provide the robust
> > security for xattrs we've been relying on, so you need some other
> > mechanism for storing them.
> 
> For NFS, there's a network traversal which is an attack surface.
> 
> A local xattr can be attacked as well: a device or bus malfunction
> can corrupt the content of an xattr, or a privileged user can modify
> it.
> 
> How does that metadata get from the software provider to the end
> user? It's got to go over a network, stored in various ways, some
> of which will not be trusted. To attain an unbroken chain of
> provenance, that metadata has to be signed.
> 
> I don't think the question is the storage mechanism, but rather the
> protection mechanism. Signing the metadata protects it in all of
> these cases.

I think we're saying about the same thing.  For most people the
security mechanism of local xattrs is sufficient.  If you're paranoid,
you don't believe it is and you use EVM.

> > I think Mimi's other point is actually that IMA uses a flat hash
> > which we derive by reading the entire file and then watching for
> > mutations. Since you cannot guarantee we get notice of mutation
> > with NFS, the entire IMA mechanism can't really be applied in its
> > current form and we have to resort to chunk at a time verifications
> > that a Merkel tree would provide.
> 
> I'm not sure what you mean by this. An NFS client relies on
> notification of mutation to maintain the integrity of its cache of
> NFS file content, and it's done that since the 1980s.

Mutation detection is part of the current IMA security model.  If IMA
sees a file mutate it has to be rehashed the next time it passes the
gate.  If we can't trust the NFS server, we can't trust the NFS
mutation notification and we have to have a different mechanism to
check the file.

> In addition to examining a file's mtime and ctime as maintained by
> the NFS server, a client can rely on the file's NFSv4 change
> attribute or an NFSv4 delegation.

And that's secure in the face of a malicious or compromised server?

The bottom line is still, I think we can't use linear hashes with an
open/exec/mmap gate with NFS and we have to move to chunk at a time
verification like that provided by a merkel tree.

James

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

