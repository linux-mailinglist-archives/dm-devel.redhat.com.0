Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 93A57F03B7
	for <lists+dm-devel@lfdr.de>; Tue,  5 Nov 2019 18:05:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572973510;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7jttV7bYfOa35Rw+dHABMEWTKANyMVYj3It2nCuoWTA=;
	b=IRmLsiYKX6BTUreLEZM+sSTIDbft7HgwfdHXoITqICj1YOGrlY1S9o3LkXMr37kvlLr5L2
	wK2hyc0V8AZLzqQpahYP5gsnsjnmWRCFigEYtbjuX1wG9iaiR1Nq+bB06kUTCj4GS7HADf
	OwFXALfteIwQpFXEFaFJHMnuoS4AjW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-w1yAlHpsOdO6OWPF9NCsOQ-1; Tue, 05 Nov 2019 12:05:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62745800683;
	Tue,  5 Nov 2019 17:05:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2871019C4F;
	Tue,  5 Nov 2019 17:05:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66DE818034EA;
	Tue,  5 Nov 2019 17:04:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA5H4kpQ020371 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Nov 2019 12:04:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA22019C6A; Tue,  5 Nov 2019 17:04:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BBD519C4F;
	Tue,  5 Nov 2019 17:04:46 +0000 (UTC)
Date: Tue, 5 Nov 2019 12:04:45 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: David Michael <fedora.dm0@gmail.com>
Message-ID: <20191105170445.GA22109@redhat.com>
References: <CAEvUa7nAYkrdsPhmQpV_ChP5Jtnn9oR2Xb=KmBbXJyTZpGUAzg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEvUa7nAYkrdsPhmQpV_ChP5Jtnn9oR2Xb=KmBbXJyTZpGUAzg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] Making udev aware of dm-init devices
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: w1yAlHpsOdO6OWPF9NCsOQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Nov 04 2019 at 10:43am -0500,
David Michael <fedora.dm0@gmail.com> wrote:

> Hi,
>=20
> I would like to be able to use a root device configured by
> dm-mod.create with an initrd in some scenarios, but it appears that
> the default udev rules do not recognize this setup which prevents
> systemd from mounting the root file system.  There is a systemd bug
> report with a demo script to illustrate what I mean.[1]  Has anyone
> here encountered this, or is there a solution already?

Why do you want this?  dm-mod.create and initrd are mutually
exclussive... that was/is the point.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

