Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DC4A8211A8C
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 05:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593659731;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ybQdcIFh2B2fSfLMZFKuJxC7dbGu6vVnISzMp8stxoM=;
	b=OFPyMYl6Rc0juTVnixMuypbVx5W3P4jiEaIJn16fvILJu8lOr12N+QtuMx9+UmPO+5EWh4
	seHpip4h/foJSO2tf/+BaGDBFNcRLnvzfq/ScrYEjYPiDp3iaW/Y4Ujq0D01IYwSy644NU
	xg85FELNrdeqmYCgN1IcK7IoTW1QzAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-Am4H5kGmO2ijO6anfv9h5g-1; Wed, 01 Jul 2020 23:15:30 -0400
X-MC-Unique: Am4H5kGmO2ijO6anfv9h5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D3918A8220;
	Thu,  2 Jul 2020 03:15:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF50079234;
	Thu,  2 Jul 2020 03:15:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA64A6C9C6;
	Thu,  2 Jul 2020 03:15:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0623Er5r017373 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 23:14:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DEF60196B7; Thu,  2 Jul 2020 03:14:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 180DF60BE1;
	Thu,  2 Jul 2020 03:14:51 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0623EnR6007452; 
	Wed, 1 Jul 2020 22:14:49 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0623EnqK007451;
	Wed, 1 Jul 2020 22:14:49 -0500
Date: Wed, 1 Jul 2020 22:14:49 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20200702031449.GB29962@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
	<5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jul 01, 2020 at 10:54:34PM +0200, Martin Wilck wrote:
> On Thu, 2020-06-18 at 18:06 -0500, Benjamin Marzinski wrote:
> >=20
> > I uploaded the test program, aio_test:
> >=20
> > https://github.com/bmarzins/test_programs.git
> >=20
> > You just need to run in on a queueing multipath device with no active
> > paths and an open count of 0. It will hang with the device open.
> > Restore
> > a path, and it will exit, and the open count will go to 0.
>=20
> Tried it now, it behaves as you say. I admit I can't imagine how the
> suspend/resume would improve anything here. Indeed, as you say, it opens=
=20
> up a race window. Another process might open the device while
> it's suspended. Worse perhaps, once the device is resumed, an uevent will=
 be=20
> generated, and stacked devices might (in principle at least) be recreated
> before we get down to flush the map.
>=20
> MAYBE the suspend/resume was necessary in the past because some earlier=
=20
> kernels wouldn't immediately fail all outstanding commands when=20
> queue_if_no_path was deactivated? (just speculating, I don't know if this
> is the case).

If you disable queue_if_no_path and then do a suspend with flushing, you
are guaranteed that the supend won't return until all the IO has
completed or failed.  This would allow anything that was waiting on
queued IO to have the IO failback, which could allow it to close the
device in time for multipath to be able to remove it (obviously this is
racey).  However, this assumes that you do your open checks after the
suspend, which multipath no longer does. I realize that multipath can't
suspend until after it tries to remove the partition devices, otherwise
those can get stuck. But there probably is some order that gets this all
right-ish.

So, for a while now, the suspending has been doing nothing for us.  We
could either try to reorder things so that we actually try to flush the
queued IOs back first (with or without suspending), or we could just
remove suspending and say that things are working fine the way they
currently are.

-Ben
=20
> Regards,
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

