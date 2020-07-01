Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D12B121149E
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 22:57:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-NcLgTm-EMMqeRrdQPrX_Vg-1; Wed, 01 Jul 2020 16:57:08 -0400
X-MC-Unique: NcLgTm-EMMqeRrdQPrX_Vg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06B131B2C99C;
	Wed,  1 Jul 2020 20:57:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD21579222;
	Wed,  1 Jul 2020 20:56:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33BAC1809543;
	Wed,  1 Jul 2020 20:56:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061KsmZW030488 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 16:54:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 699242144B4F; Wed,  1 Jul 2020 20:54:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65F9D2144B47
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 20:54:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58279800143
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 20:54:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-438-5-kw4sgYNEutLBBoc8MZuw-1;
	Wed, 01 Jul 2020 16:54:42 -0400
X-MC-Unique: 5-kw4sgYNEutLBBoc8MZuw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4BA1BACCC;
	Wed,  1 Jul 2020 20:54:41 +0000 (UTC)
Message-ID: <5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
From: Martin Wilck <martin.wilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
In-Reply-To: <20200618230625.GJ5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
MIME-Version: 1.0
Date: Wed, 01 Jul 2020 22:54:34 +0200
User-Agent: Evolution 3.36.3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 061KsmZW030488
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-06-18 at 18:06 -0500, Benjamin Marzinski wrote:
>=20
> I uploaded the test program, aio_test:
>=20
> https://github.com/bmarzins/test_programs.git
>=20
> You just need to run in on a queueing multipath device with no active
> paths and an open count of 0. It will hang with the device open.
> Restore
> a path, and it will exit, and the open count will go to 0.

Tried it now, it behaves as you say. I admit I can't imagine how the
suspend/resume would improve anything here. Indeed, as you say, it opens=20
up a race window. Another process might open the device while
it's suspended. Worse perhaps, once the device is resumed, an uevent will b=
e=20
generated, and stacked devices might (in principle at least) be recreated
before we get down to flush the map.

MAYBE the suspend/resume was necessary in the past because some earlier=20
kernels wouldn't immediately fail all outstanding commands when=20
queue_if_no_path was deactivated? (just speculating, I don't know if this
is the case).

Regards,
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

