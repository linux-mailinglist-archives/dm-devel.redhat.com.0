Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A84F8F10EF
	for <lists+dm-devel@lfdr.de>; Wed,  6 Nov 2019 09:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573028437;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LNmZnlZxr1gFGKEKbIbyZPDanGmqc1JfqI8fATecT+c=;
	b=WQF4HhmIMOTPsI3vTp0xAmTm1pEx8qLnQEGG/lcC1jQ+k19OQA1volsG7IjG6/EE/bd2Op
	ofIfmi9IvbBU1IMMt72fxcAEiYFx7Xi5+1SfCc09Vw+UTqFjo2OxK2D+JO8Fq3xgWuUFH6
	JF9waAMCKM1FJPnI3kkOYNotZkQF76g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-ASIXuA09M1KwjBgE5WXAyA-1; Wed, 06 Nov 2019 03:20:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D1A92A3;
	Wed,  6 Nov 2019 08:20:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F35D5D9E5;
	Wed,  6 Nov 2019 08:20:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 030514BB65;
	Wed,  6 Nov 2019 08:20:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA5HmDJu022358 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Nov 2019 12:48:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5CCB45D713; Tue,  5 Nov 2019 17:48:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9C295D6A3;
	Tue,  5 Nov 2019 17:48:07 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF235C058CB8;
	Tue,  5 Nov 2019 17:48:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a15so22462962wrf.9;
	Tue, 05 Nov 2019 09:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xMNZG71OnVgt9mqBrf6RptH3WNq1vaemrD1YygADhOU=;
	b=JpVM+/inx2yUkTiEFa66oBb6xnUS4lpMLwrHNH6SWA8VIOW1cnvPn6y/XhPtjPqt76
	UB+tg8iyi5y8/zOXzY6xhnZikQFMiEDiiKo6rVCPLks08X8aFFX0v2w6JfDlVrYDESDp
	QvVfUlartKvKJKEy/+SkzAd0wdW8bPJYFPb73Zw9dpx+kLwfrWaaR+rxxpg51y+mgbGW
	LnI38whcod2W88Pk3tfRQ8O5GAI0QTaNOughvcAMbJ05sO8G+ydgmLbJEMBCX06rteh/
	eGIqsH2uT5OTUlSmDNKUBAOC7z+vtfzDTwW/K1/cbc+qTMNxotuksAoXHk7tTK2lSTjU
	DrIg==
X-Gm-Message-State: APjAAAWMTRKBUbAkSOa4stuFDRV/wrvm0lQ0R9fnByBbWrOIp1X8Q8t/
	Vi2GUU+xUc4izQRuJ2iUiA7C77RziLzJy1MZsUfOSQ==
X-Google-Smtp-Source: APXvYqxOFcRrbjme2332ZaRiqFs0wp0lb1cGOY84g1dbfdGIDZX0zb6VeuklzysosqZaLQ0am0HGYV7i8n8npQJl9Sk=
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr21489286wrj.391.1572976085390;
	Tue, 05 Nov 2019 09:48:05 -0800 (PST)
MIME-Version: 1.0
References: <CAEvUa7nAYkrdsPhmQpV_ChP5Jtnn9oR2Xb=KmBbXJyTZpGUAzg@mail.gmail.com>
	<20191105170445.GA22109@redhat.com>
In-Reply-To: <20191105170445.GA22109@redhat.com>
From: David Michael <fedora.dm0@gmail.com>
Date: Tue, 5 Nov 2019 12:47:54 -0500
Message-ID: <CAEvUa7n9HTc=4is6ESTWR8S1jzjGisSv_tGcVX7_O_QoYGSUCg@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 05 Nov 2019 17:48:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Tue, 05 Nov 2019 17:48:07 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'fedora.dm0@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <fedora.dm0@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 06 Nov 2019 03:19:57 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ASIXuA09M1KwjBgE5WXAyA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2019 at 12:04 PM Mike Snitzer <snitzer@redhat.com> wrote:
> On Mon, Nov 04 2019 at 10:43am -0500,
> David Michael <fedora.dm0@gmail.com> wrote:
>
> > Hi,
> >
> > I would like to be able to use a root device configured by
> > dm-mod.create with an initrd in some scenarios, but it appears that
> > the default udev rules do not recognize this setup which prevents
> > systemd from mounting the root file system.  There is a systemd bug
> > report with a demo script to illustrate what I mean.[1]  Has anyone
> > here encountered this, or is there a solution already?
>
> Why do you want this?  dm-mod.create and initrd are mutually
> exclussive... that was/is the point.

I am using the same image building process for custom systems with
dm-init etc. built into the kernel and for Fedora-based systems, which
require an initrd to load the device mapper kernel modules as well as
NVMe support so it can find the devices in the first place.  I'd
prefer to be uniform and use dm-mod.create everywhere rather than
bundle the configuration into an initrd for certain distros (or be
uniform by creating initrds for my custom builds that don't otherwise
need one).

As mentioned in the systemd bug, dm-mod.create works correctly with an
initrd aside from udev needing to be manually triggered before systemd
can use it.  I was looking for suggestions for how this could be
handled upstream ideally so I don't have to customize an initrd to add
a udevadm trigger.

Thanks.

David

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

