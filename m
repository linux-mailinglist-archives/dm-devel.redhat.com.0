Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D0AF6244529
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:04:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-6xPpDp10ONi7rEd1bWZ2yw-1; Fri, 14 Aug 2020 03:04:42 -0400
X-MC-Unique: 6xPpDp10ONi7rEd1bWZ2yw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E47E0106B821;
	Fri, 14 Aug 2020 07:04:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2990709CA;
	Fri, 14 Aug 2020 07:04:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 792C3180B655;
	Fri, 14 Aug 2020 07:04:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DELj7e018672 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 10:21:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 960CB2166BA3; Thu, 13 Aug 2020 14:21:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 916FD2166B44
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 14:21:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A66BF1859170
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 14:21:42 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-62-65p37LOrMe2T7WH_rcnNzA-1; Thu, 13 Aug 2020 10:21:37 -0400
X-MC-Unique: 65p37LOrMe2T7WH_rcnNzA-1
Received: by mail-io1-f66.google.com with SMTP id b16so7491483ioj.4;
	Thu, 13 Aug 2020 07:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZFwKOeefuJ9BwLJB/h+tffKpE4E/wD0tX8RKafaeamo=;
	b=eybw10MbOM8+kDsepDdGC5pX5ZelYVjkADrMiQGE3wVk0hqRAItMHZwadjNQCpbVrn
	F9Mm4GXZM4zWbjZThoSUU36f3JlUTOy9Z69vhjWxaXES5V5s45teB/OiagmGvdTPdxZb
	Sc8Zt3lFV82T0oQ/vAFkrMRJXg7HTBGBo3zSffqKNM1Kfm1rbKIt1e6/2pR2pYkUf6e2
	Kl/Pea7JhsKHOgJ47InxuceKKzPHcaD9DishP1tnJxeaRhwMW/1l9pcTksY1qUYELe7p
	yCtWEVMDK/qf+tEJLc4Dkh85LGGYWNwWBHTFxJ1n97ohof0rO7pR5gtoGkdTs3Mic8fZ
	+Rzw==
X-Gm-Message-State: AOAM531jen0wMEn/RS9P/YQjNwo+9t89THtRKgrBX+wOBQDk9PPqs20G
	Ory4ZlfCOosYI3RZ/pXGUvs=
X-Google-Smtp-Source: ABdhPJyIYg/Gw5O8Yh4tpNhKC70T2a7HFu6GXj7JTm3lSbVP6GV4lvCqcS7CdoqeZfjnwUtDnUf5Jw==
X-Received: by 2002:a02:cc53:: with SMTP id i19mr5342744jaq.33.1597328496878; 
	Thu, 13 Aug 2020 07:21:36 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id t88sm1541411ild.8.2020.08.13.07.21.32
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2020 07:21:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <1597246946.7293.9.camel@HansenPartnership.com>
Date: Thu, 13 Aug 2020 10:21:31 -0400
Message-Id: <3F328A12-25DD-418B-A7D0-64DA09236E1C@gmail.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07DELj7e018672
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 12, 2020, at 11:42 AM, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> On Wed, 2020-08-12 at 09:56 -0400, Chuck Lever wrote:
>>> On Aug 11, 2020, at 2:28 PM, James Bottomley <James.Bottomley@Hanse
>>> nPartnership.com> wrote:
>>> 
>>> On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
>>>> Mimi's earlier point is that any IMA metadata format that
>>>> involves unsigned digests is exposed to an alteration attack at
>>>> rest or in transit, thus will not provide a robust end-to-end
>>>> integrity guarantee.
>>> 
>>> I don't believe that is Mimi's point, because it's mostly not
>>> correct: the xattr mechanism does provide this today.  The point is
>>> the mechanism we use for storing IMA hashes and signatures today is
>>> xattrs because they have robust security properties for local
>>> filesystems that the kernel enforces.  This use goes beyond IMA,
>>> selinux labels for instance use this property as well.
>> 
>> I don't buy this for a second. If storing a security label in a
>> local xattr is so secure, we wouldn't have any need for EVM.
> 
> What don't you buy?  Security xattrs can only be updated by local root.
> If you trust local root, the xattr mechanism is fine ... it's the only
> one a lot of LSMs use, for instance.  If you don't trust local root or
> worry about offline backups, you use EVM.  A thing isn't secure or
> insecure, it depends on the threat model.  However, if you don't trust
> the NFS server it doesn't matter whether you do or don't trust local
> root, you can't believe the contents of the xattr.
> 
>>> What I think you're saying is that NFS can't provide the robust
>>> security for xattrs we've been relying on, so you need some other
>>> mechanism for storing them.
>> 
>> For NFS, there's a network traversal which is an attack surface.
>> 
>> A local xattr can be attacked as well: a device or bus malfunction
>> can corrupt the content of an xattr, or a privileged user can modify
>> it.
>> 
>> How does that metadata get from the software provider to the end
>> user? It's got to go over a network, stored in various ways, some
>> of which will not be trusted. To attain an unbroken chain of
>> provenance, that metadata has to be signed.
>> 
>> I don't think the question is the storage mechanism, but rather the
>> protection mechanism. Signing the metadata protects it in all of
>> these cases.
> 
> I think we're saying about the same thing.

Roughly.


> For most people the
> security mechanism of local xattrs is sufficient.  If you're paranoid,
> you don't believe it is and you use EVM.

When IMA metadata happens to be stored in local filesystems in
a trusted xattr, it's going to enjoy the protection you describe
without needing the addition of a cryptographic signature.

However, that metadata doesn't live its whole life there. It
can reside in a tar file, it can cross a network, it can live
on a back-up tape. I think we agree that any time that metadata
is in transit or at rest outside of a Linux local filesystem, it
is exposed.

Thus I'm interested in a metadata protection mechanism that does
not rely on the security characteristics of a particular storage
container. For me, a cryptographic signature fits that bill
nicely.


>>> I think Mimi's other point is actually that IMA uses a flat hash
>>> which we derive by reading the entire file and then watching for
>>> mutations. Since you cannot guarantee we get notice of mutation
>>> with NFS, the entire IMA mechanism can't really be applied in its
>>> current form and we have to resort to chunk at a time verifications
>>> that a Merkel tree would provide.
>> 
>> I'm not sure what you mean by this. An NFS client relies on
>> notification of mutation to maintain the integrity of its cache of
>> NFS file content, and it's done that since the 1980s.
> 
> Mutation detection is part of the current IMA security model.  If IMA
> sees a file mutate it has to be rehashed the next time it passes the
> gate.  If we can't trust the NFS server, we can't trust the NFS
> mutation notification and we have to have a different mechanism to
> check the file.

When an NFS server lies about mtime and ctime, then NFS is completely
broken. Untrusted NFS server doesn't mean "broken behavior" -- I
would think that local filesystems will have the same problem if
they can't trust a local block device to store filesystem metadata
like indirect blocks and timestamps.

It's not clear to me that IMA as currently implemented can protect
against broken storage devices or incorrect filesystem behavior.


>> In addition to examining a file's mtime and ctime as maintained by
>> the NFS server, a client can rely on the file's NFSv4 change
>> attribute or an NFSv4 delegation.
> 
> And that's secure in the face of a malicious or compromised server?
> 
> The bottom line is still, I think we can't use linear hashes with an
> open/exec/mmap gate with NFS and we have to move to chunk at a time
> verification like that provided by a merkel tree.

That's fine until we claim that remote filesystems require one form of
metadata and local filesystems use some other form.

To guarantee an unbroken chain of provenance, everyone has to use the
same portable metadata format that is signed once by the content creator.
That's essentially why I believe the Merkle-based metadata format must
require that the tree root is signed.


--
Chuck Lever
chucklever@gmail.com




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

