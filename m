Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 91D5F1D9975
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 16:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589898237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qv/p2dRCllYQpXdXZ3OHjXCY4wrTQ5bua4sKpc48H3E=;
	b=TcOUxuUDhuj7hAVaa5xgWXS3ELMOadZpdTLSlvrOqSgSO1r0bf/IHhd8Z2XNzkzeNDUDr1
	4fU5Sw/9igb8AkMt6Qk4oLwUBeJpIo/NDVZcxkl2G0ya4L84PK+QB4jCbPoYStzMOi6hS6
	lgHV86ueay7+83L62xIS8LaH90opUJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-SS-a21AkN8ObWaOAMXCzbQ-1; Tue, 19 May 2020 10:23:55 -0400
X-MC-Unique: SS-a21AkN8ObWaOAMXCzbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E3D71800D42;
	Tue, 19 May 2020 14:23:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35C7C1001925;
	Tue, 19 May 2020 14:23:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCDD51809547;
	Tue, 19 May 2020 14:23:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JENLHc029810 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 10:23:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFFD95D9CD; Tue, 19 May 2020 14:23:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4BCA5D9C5;
	Tue, 19 May 2020 14:23:18 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04JENHGp006568; 
	Tue, 19 May 2020 09:23:17 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04JENGeP006567;
	Tue, 19 May 2020 09:23:16 -0500
Date: Tue, 19 May 2020 09:23:16 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20200519142316.GY5907@octiron.msp.redhat.com>
References: <1589864228-1363-1-git-send-email-bmarzins@redhat.com>
	<d7168e4c5ab1a2deabb10ade2d35ea64e2c22ff7.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <d7168e4c5ab1a2deabb10ade2d35ea64e2c22ff7.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 0/6] multipath: path validation library
	prep work
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, May 19, 2020 at 02:55:05PM +0200, Martin Wilck wrote:
> On Mon, 2020-05-18 at 23:57 -0500, Benjamin Marzinski wrote:
> > I've been playing around with the SID code more and I've decided to
> > hold
> > off on submitting the library until I have it working with the SID
> > multipath module better. Instead, I've pulled out the common code
> > thatremember_cmdline_wwid
> > multipath -u/-c and the library can use, and put it into
> > libmultipath.
> >=20
> > I've also removed some of the ordering differences between the
> > existing
> > code and my new code.  Right now, the only difference is that if a
> > path
> > is currently multipathed, it will always be claimed as a valid path.
> >=20
> > Patches 0001 & 0002 are the same as in my "RFC PATCH v2" set, and
> > patch
> > 0005 is the same as my "libmultipath: simplify failed wwid code"
> > patch.
> >=20
> > Only patches 0003 and 0004 haven't been posted before.
> >=20
> > Changes from v1:
> > 0003: Minor fixes suggested by Martin Wilck
> > 0004: Fixed typo, added tests for filter_property() and switched some
> >       tests to pass the check_multipathd code in various ways,
> > instead
> >       of skipping it, as suggested by Martin Wilck
> >=20
>=20
> This set (v2) doesn't apply cleanly to upstream, neither with or
> without my late patches. It's been generated against a tree that
> included "Make multipath add wwids from kernel cmdline mpath.wwids with
> -A" (https://patchwork.kernel.org/patch/4445691/). From my series, it's
> missing "libmultipath: move libsg into libmultipath".
>=20
> Apart from that, for the series:
>=20
> Reviewed-by: Martin Wilck <mwilck@suse.com>

Whoops. I accidentally sent patches from the branch that's built on top
of my latest RHEL code. Resending.

-Ben
=20
> Martin
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix
> Imend=F6rffer
>=20
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

