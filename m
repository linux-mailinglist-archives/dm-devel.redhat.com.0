Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F73D137C
	for <lists+dm-devel@lfdr.de>; Wed,  9 Oct 2019 18:02:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85D22309DEF9;
	Wed,  9 Oct 2019 16:02:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25298601A2;
	Wed,  9 Oct 2019 16:02:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E66F01808878;
	Wed,  9 Oct 2019 16:02:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x99G1pG4012458 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Oct 2019 12:01:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE15519C69; Wed,  9 Oct 2019 16:01:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D84473CC8
	for <dm-devel@redhat.com>; Wed,  9 Oct 2019 16:01:48 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C98BF18C4285
	for <dm-devel@redhat.com>; Wed,  9 Oct 2019 16:01:46 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j31so4158460qta.5
	for <dm-devel@redhat.com>; Wed, 09 Oct 2019 09:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZWFHkd6ek0BtHyg9BV3fh9tCSDHEofWpBNJTTKARQwo=;
	b=OSjmZgLlCSgs1erlGITVuT28OJ9APoDIOa8Bn3pBjFp8QYEB2f/2FMZEuI0o1JWiT7
	hVFrIuVOsorHarMrmb9cOWywkfGDOjhhoDwi/7A+LQ7gsQPebZgY/thqHVAPe1IBaOBV
	WDm2JsVyWQ0vGQrstryNL/SY3jHapVH6pLHsSM2ej9GygCq1v/QdRTdPIiBsJRLQ9+w4
	6r3LxmV8PgPMoNHnDZUBsEi04utd1yH9eNzSIZ2qbP+f2Aat3F30KHiMXnUgPzv/oGql
	Oro5evpcB6T/p90F0dkfr0njvgH47slLgoLSpDQDsClmttvWHNW83I+e0Q+d6RiWRxiT
	t2FA==
X-Gm-Message-State: APjAAAVcJhkznbkF4qbAtgGWYGp4Hauml6+rVRzTGDGm3DwGaWnH7WkN
	ZS1HW9kp04HRKlc63dupkb0d0L1g0tf8wh2yCEU=
X-Google-Smtp-Source: APXvYqxJLyCeHAUAU1azpG4v5iXs9SXOmBMoaRvC78sbGAuHi5eUtVSvqkcf9ThEOBLk2iBn+of79sDp2hHG8oqoBW0=
X-Received: by 2002:ac8:729a:: with SMTP id v26mr4380259qto.18.1570636905814; 
	Wed, 09 Oct 2019 09:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190918153445.1241-1-maier@linux.ibm.com>
In-Reply-To: <20190918153445.1241-1-maier@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 9 Oct 2019 18:01:29 +0200
Message-ID: <CAK8P3a1HBog84Wvdgm1ccz1gRJRxHm8ucsxwUTTqh02gOt9WbQ@mail.gmail.com>
To: Steffen Maier <maier@linux.ibm.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Wed, 09 Oct 2019 16:01:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Wed, 09 Oct 2019 16:01:46 +0000 (UTC) for IP:'209.85.160.195'
	DOMAIN:'mail-qt1-f195.google.com'
	HELO:'mail-qt1-f195.google.com' FROM:'arndbergmann@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.253  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.160.195 mail-qt1-f195.google.com 209.85.160.195
	mail-qt1-f195.google.com <arndbergmann@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390 <linux-s390@vger.kernel.org>,
	Benjamin Block <bblock@linux.ibm.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi <linux-scsi@vger.kernel.org>,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, dm-devel@redhat.com,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Doug Gilbert <dgilbert@interlog.com>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Omar Sandoval <osandov@fb.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [dm-devel] [PATCH] compat_ioctl: fix reimplemented SG_IO
 handling causing -EINVAL from sg_io()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 09 Oct 2019 16:02:22 +0000 (UTC)

On Wed, Sep 18, 2019 at 5:35 PM Steffen Maier <maier@linux.ibm.com> wrote:
>
> scsi_cmd_ioctl() had hdr as on stack auto variable and called
> copy_{from,to}_user with the address operator &hdr and sizeof(hdr).
>
> After the refactoring, {get,put}_sg_io_hdr() takes a pointer &hdr.
> So the copy_{from,to}_user within the new helper functions should
> just take the given pointer argument hdr and sizeof(*hdr).
>
> I saw -EINVAL from sg_io() done by /usr/lib/udev/scsi_id which could
> in turn no longer whitelist SCSI disks for devicemapper multipath.
>
> Signed-off-by: Steffen Maier <maier@linux.ibm.com>
> Fixes: 4f45155c29fd ("compat_ioctl: reimplement SG_IO handling")
> ---
>
> Arnd, I'm not sure about the sizeof(hdr32) change in the compat part in
> put_sg_io_hdr().
>
> This is for next, probably via Arnd's y2038/y2038,
> and it fixes next-20190917 for me regarding SCSI generic.

Hi Steffen,

Sorry for the long delay. I ended up not sending my pull request for
v5.4, so the bug is not there. I have now rebased my branch
on top of v5.4-rc2 and plan to send it for the v5.5 merge window.

I have folded your bugfix into my original patch, hope that's ok with
you. Tomorrow's linux-next should be fixed.

    Arnd

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
