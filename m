Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C264B96
	for <lists+dm-devel@lfdr.de>; Wed, 10 Jul 2019 19:42:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E4DC7FDEC;
	Wed, 10 Jul 2019 17:42:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76EA860143;
	Wed, 10 Jul 2019 17:42:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F395206D2;
	Wed, 10 Jul 2019 17:42:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6AHgGx8007094 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jul 2019 13:42:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8592D60603; Wed, 10 Jul 2019 17:42:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0F660600;
	Wed, 10 Jul 2019 17:42:14 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2886B30BD1A8;
	Wed, 10 Jul 2019 17:42:13 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h10so2958640ljg.0;
	Wed, 10 Jul 2019 10:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1WpFXJ+cDW2SWOHQ18ch9HtYYISEzq7Qo1xVKKKW+wI=;
	b=X2wu80yxp5Ibvh3CehoAjIGPBva7r9iaw+mmbUq2UpWgLLui+V7iKUWI79G2G26wQV
	lwlfIwiYpjrjmU4ZJqdpGc0C6b6bE1b5lgkA1iEC+i2O9MfpZdPU1wpx26CECcFxrGRt
	cUAJWw7JuXCVhLHDO3q8ACSx8aNXMi0K16LJzODfTezPm+xqYk9dGg0NY1Mgz2CvAR/G
	69vZ+s+D/mKVsGZwp9RdBjjhPJqCt9NC36AGni82nWMwXJr4sgoBKShms1TCC6UmEtyQ
	PKyvZFynuJhaiZ3JR9b6zXuGqBzo3UTrCoaGUy33yybceiBFUAFLS54bQJnZztFi76nX
	gR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1WpFXJ+cDW2SWOHQ18ch9HtYYISEzq7Qo1xVKKKW+wI=;
	b=bYIVD0OeNJGRe/NpJEFl12S4MK/rDH4ZVEO5Z3yssrg+8VVPZFuIV2XWpUCnjDpq8k
	Xa2JnujhZCfCCuYayI+ydC0kZBRL6KtCu38D/el7pTgKAZynMfLmGRvo5FrWGMc+yuFA
	x+3AsCTEyuOsWGoiRLwcNK7jYb1Fzado8AkKCVFJ0sAaZLMViz1vPci7gZiIo6RhJbbx
	/OQyN5qeA/mdP2ZmIZTQ681DQFUwrFDIxzeyGLsfRfHb0bkTCd69DEAyI9BEeibyQbix
	kWusobQoPJEklF6QNtgSfP73CMd1zOkjqRDKZTDRNdrhcZbUFhrF1HxCvLm94L35rGzG
	KO/w==
X-Gm-Message-State: APjAAAV0K7EKx/YeyskBePrTftA3oIs2+bJfEs93Kmi0Ov3GquJeIHfw
	7yb4h/o7otrLQVfSV9nB7nj3NYomxxqTyortzJ9f/t8r
X-Google-Smtp-Source: APXvYqzypovLAt4XNS0zfjCCFflJdfJ+R2lkn3yAe/g2/60N1wHuqHVOXSkDraVYYwMRZpXbxvDF0drL1V/U8DU6it0=
X-Received: by 2002:a2e:92c6:: with SMTP id k6mr18383483ljh.148.1562780531602; 
	Wed, 10 Jul 2019 10:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190709073909.32112-1-martin.wilck@suse.com>
	<20190709073909.32112-5-martin.wilck@suse.com>
	<CAAMCDeeC31_C_4_CWXucmA2zeTvVqig3CsUmikfuuJA1V5YWRg@mail.gmail.com>
	<ba52db4bc532fe1f0ab4af0981c140eb4f339d68.camel@suse.com>
In-Reply-To: <ba52db4bc532fe1f0ab4af0981c140eb4f339d68.camel@suse.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 10 Jul 2019 12:42:00 -0500
Message-ID: <CAAMCDeeiDbQfmF8NrOpy5MHjaX3AvbA7VytAeZSoDb0z9R17vg@mail.gmail.com>
To: Martin Wilck <Martin.Wilck@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 10 Jul 2019 17:42:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 10 Jul 2019 17:42:13 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'rogerheflin@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 1.194 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, PDS_NO_HELO_DNS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <rogerheflin@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] libmultipath: trigger uevents for
 partitions, too
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 10 Jul 2019 17:42:51 +0000 (UTC)

On Wed, Jul 10, 2019 at 5:49 AM Martin Wilck <Martin.Wilck@suse.com> wrote:
>
> On Tue, 2019-07-09 at 11:40 -0500, Roger Heflin wrote:
> > We have an observed behavior as follows:
> >
> > When the host boots up, a uuid symbolic link is created pointing at
> > /dev/sda1 (device for /boot)
> >
> > Multipath starts up and creates an multipath device to manage
> > /dev/sda
> > and a udev rule deletes /dev/sda1 invalidating the symbolic link.
>
> I suppose you are talking about 68-del-part-nodes.rules. Note that the
> rules in this file can be deactivated by setting
> ENV{DONT_DEL_PART_NODES}="1" in an early udev rule.

The OS we have uses 62-multipath and does not have a global override like that.

I am looking at my notes on the issue and it was this:
rootvg gets started directly on /dev/sda2 and then multipath starts up
and attempts to mange it and deletes the partition on /dev/sda1
causing the by-uuid link to be invalid but multipath fails to create
the device with "map in use" because the lv's for rootvg are live on
/dev/sda2 directly.   So it does sound like your fix would would
correct this issue since on the multipath failure to manage it would
recreate the /dev/sda1 device.  There appears to be some race
condition in the initramfs/systemd where sometimes rootvg gets started
before multipath has managed the device causing the partition to be
deleted (we have multipath is the initramfs, and that was confirmed).
All of our other vg's dont have this issue as we are using the
rd.lvm.vg= such that only the rootvg gets turned on early.

>
> Also, the rule only removes partitions for devices that have been
> detected as being eligible for multipathing.
>
> > The symbolic link does not appear to get re-created to point to the
> > new multipath device which would lead one to suspect that there was
> > no
> > event happening for when the multipath device is created.
>
> That's very unlikely. You should verify that the multipath device (for
> sda) is created. My patch here relates only to the case where creating
> the multipath device *fails*.
>
?
>
> Maybe. I don't know enough details about your configuration to tell.
> But if this is a device that should not be multipathed, from my point
> of view, proper blacklisting via multipath.conf is the recommended way
> to handle this problem.
>
> You can also use "find_multipaths"; please check the documentation.
> Note also that since 0.7.8, blacklisting "by protocol" is possible,
> which makes it possible e.g. to blacklist local SATA disks with a
> simple statement.
>
We intentionally have find_multipaths set to allow a single path.  The
issue is on a number of VM and using multipath for everything allows
us to not have separate work instructions/scripts for VM's vs
physical, and also allows using multipath to use io retries to work
around short-term external vmhost and storage issues without having to
identify what nodes were affected and reboot them all (they just pause
and continue once the issue is fixed).  It is a very large environment
and things happen in the different sections of the environment and we
have been tweaking various configuration settings to result in less
trouble/more stability when things happen.   The environment has >5000
linux VM's and > 5000 physical linux hosts.

> Martin
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
