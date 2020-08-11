Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EFC1B241D40
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 17:33:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-q5mYxdwpNEmv8pgyzr4Nqw-1; Tue, 11 Aug 2020 11:33:38 -0400
X-MC-Unique: q5mYxdwpNEmv8pgyzr4Nqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA37A1090821;
	Tue, 11 Aug 2020 15:33:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 253DD5D9D7;
	Tue, 11 Aug 2020 15:33:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 120891809554;
	Tue, 11 Aug 2020 15:33:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BFX2Qx023156 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 11:33:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B38C1054FBF; Tue, 11 Aug 2020 15:33:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 971381054FA1
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 15:32:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADEBC800800
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 15:32:59 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-217-vUC8em3fO9ahRvhIUnWf8w-1;
	Tue, 11 Aug 2020 11:32:54 -0400
X-MC-Unique: vUC8em3fO9ahRvhIUnWf8w-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id E738F8EE19D; 
	Tue, 11 Aug 2020 08:32:51 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id b3YM1B3UJc5Z; Tue, 11 Aug 2020 08:32:51 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
	[73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7D8168EE149;
	Tue, 11 Aug 2020 08:32:50 -0700 (PDT)
Message-ID: <1597159969.4325.21.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Chuck Lever <chucklever@gmail.com>
Date: Tue, 11 Aug 2020 08:32:49 -0700
In-Reply-To: <16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
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
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
> > On Aug 11, 2020, at 1:43 AM, James Bottomley
> > <James.Bottomley@HansenPartnership.com> wrote:
> > On Mon, 2020-08-10 at 19:36 -0400, Chuck Lever wrote:
[...]
> > > Thanks for the help! I just want to emphasize that documentation
> > > (eg, a specification) will be critical for remote filesystems.
> > > 
> > > If any of this is to be supported by a remote filesystem, then we
> > > need an unencumbered description of the new metadata format
> > > rather than code. GPL-encumbered formats cannot be contributed to
> > > the NFS standard, and are probably difficult for other
> > > filesystems that are not Linux-native, like SMB, as well.
> > 
> > I don't understand what you mean by GPL encumbered formats.  The
> > GPL is a code licence not a data or document licence.
> 
> IETF contributions occur under a BSD-style license incompatible
> with the GPL.
> 
> https://trustee.ietf.org/trust-legal-provisions.html
> 
> Non-Linux implementers (of OEM storage devices) rely on such
> standards processes to indemnify them against licensing claims.

Well, that simply means we won't be contributing the Linux
implementation, right? However, IETF doesn't require BSD for all
implementations, so that's OK.

> Today, there is no specification for existing IMA metadata formats,
> there is only code. My lawyer tells me that because the code that
> implements these formats is under GPL, the formats themselves cannot
> be contributed to, say, the IETF without express permission from the
> authors of that code. There are a lot of authors of the Linux IMA
> code, so this is proving to be an impediment to contribution. That
> blocks the ability to provide a fully-specified NFS protocol
> extension to support IMA metadata formats.

Well, let me put the counterpoint: I can write a book about how linux
device drivers work (which includes describing the data formats), for
instance, without having to get permission from all the authors ... or
is your lawyer taking the view we should be suing Jonathan Corbet,
Alessandro Rubini, and Greg Kroah-Hartman for licence infringement?  In
fact do they think we now have a huge class action possibility against
O'Reilly  and a host of other publishers ...

> > The way the spec process works in Linux is that we implement or
> > evolve a data format under a GPL implementaiton, but that
> > implementation doesn't implicate the later standardisation of the
> > data format and people are free to reimplement under any licence
> > they choose.
> 
> That technology transfer can happen only if all the authors of that
> prototype agree to contribute to a standard. That's much easier if
> that agreement comes before an implementation is done. The current
> IMA code base is more than a decade old, and there are more than a
> hundred authors who have contributed to that base.
> 
> Thus IMO we want an unencumbered description of any IMA metadata
> format that is to be contributed to an open standards body (as it
> would have to be to extend, say, the NFS protocol).

Fine, good grief, people who take a sensible view of this can write the
data format down and publish it under any licence you like then you can
pick it up again safely.  Would CC0 be OK? ... neither GPL nor BSD are
document licences and we shouldn't perpetuate bad practice by licensing
documentation under them.

James

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

