Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 593E230429D
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jan 2021 16:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611675062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bfAJT/uEn2vCLkV/XOasTUddapp73f0lGD5EEqAesr8=;
	b=UR6dsU/GFSYlQazlHQ7X2ueLOfIZdlESimWrZMc0vQZB/q0Lz8m1WOvMXah7Cs3FDYwM0/
	SJlWJeiJGNe5+prADa449nHY/vNTp+L12rlEZ2/gv+P5a2DpxIeviwu+3zfx3ek/hxw+Os
	OYm/9vcakbr1YoCsvws7yvPf6QfKj7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-nkzeiTawNo6j16XGIQpALg-1; Tue, 26 Jan 2021 10:30:58 -0500
X-MC-Unique: nkzeiTawNo6j16XGIQpALg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BDED8017FB;
	Tue, 26 Jan 2021 15:30:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C97626F439;
	Tue, 26 Jan 2021 15:30:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DF25180954D;
	Tue, 26 Jan 2021 15:30:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QFUfbf016309 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 10:30:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 123CB60636; Tue, 26 Jan 2021 15:30:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A4F6F45C;
	Tue, 26 Jan 2021 15:30:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10QFUaKL011530; 
	Tue, 26 Jan 2021 09:30:36 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10QFUZjN011529;
	Tue, 26 Jan 2021 09:30:35 -0600
Date: Tue, 26 Jan 2021 09:30:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210126153035.GF15006@octiron.msp.redhat.com>
References: <1611639064-8187-1-git-send-email-bmarzins@redhat.com>
	<6841a7ef1f82a5d2d9614b9eeccf3e4b2c6f2e65.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <6841a7ef1f82a5d2d9614b9eeccf3e4b2c6f2e65.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmpathpersist: fix thread safety of
	default functions
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
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 09:36:59AM +0000, Martin Wilck wrote:
> On Mon, 2021-01-25 at 23:31 -0600, Benjamin Marzinski wrote:
> > commit a839e39e ("libmpathpersist: factor out initialization and
> > teardown") made mpath_presistent_reserve_{in,out} use share variables
> > for curmp and pathvec.=A0 There are users of this library that call
> > these
> > functions in a multi-threaded process, and this change causes their
> > application to crash. config and udev are also shared variables, but
> > libmpathpersist doesn't write to the config in
> > mpath_presistent_reserve_{in,out}, and looking into the libudev code,
> > I
> > don't see any place where libmpathpersist uses the udev object in a
> > way
> > that isn't thread-safe.
> >=20
> > This patch makes mpath_presistent_reserve_{in,out} go back to using
> > local variables for curmp and pathvec, so that multiple threads won't
> > be operating on these variables at the same time.
>=20
> Reviewed-by: Martin Wilck <mwilck@suse.com>
>=20
> Out of curiosity: what's the multi-threaded application?

Dunno. I just got the bug report saying that their multithreaded
application is crashing.

-Ben

>=20
> Regards,
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

