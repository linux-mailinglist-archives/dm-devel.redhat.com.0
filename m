Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BDE35862
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 10:18:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3217230860C6;
	Wed,  5 Jun 2019 08:18:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 025FE60CD6;
	Wed,  5 Jun 2019 08:18:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DF131806B11;
	Wed,  5 Jun 2019 08:17:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x54JZEQf015579 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 15:35:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8541618220; Tue,  4 Jun 2019 19:35:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F17B17F55
	for <dm-devel@redhat.com>; Tue,  4 Jun 2019 19:35:12 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7316B3162909
	for <dm-devel@redhat.com>; Tue,  4 Jun 2019 19:35:03 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id t16so4471811pfe.11
	for <dm-devel@redhat.com>; Tue, 04 Jun 2019 12:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=message-id:mime-version:content-transfer-encoding:in-reply-to
	:references:cc:to:from:subject:user-agent:date;
	bh=xTD3XYO7Igxo0exyVWI6cc/41JrtEN9oQdvmNtmSfwE=;
	b=e65zpbS38buPRA7hJtKymGX9tOAOvBPPnprOcQ6P31L4GDzt+jIz0g3GAnaNu6GwrK
	hXlj+/nGYhqoWPwArQB6kpxB0vnmyu9pMLgzZCwXSQeWDJ4VaDBX6ebIrbJq4LqWNsil
	nyb5IFzRCjhcgcgLI1jmjaOzRFqzAy3rG/zw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:mime-version
	:content-transfer-encoding:in-reply-to:references:cc:to:from:subject
	:user-agent:date;
	bh=xTD3XYO7Igxo0exyVWI6cc/41JrtEN9oQdvmNtmSfwE=;
	b=T/2xBghjlrl+M6RaAtudpB4uR62SFW90ShG9YXMuZQba8rIErTgKPv4ghmtiMbU/yh
	VIvZurccsGmC7Ta+3WxXtrFZIUJbBL1sAX9oiArjjm7h/ux32/cZseNs09ROFahe2pQ8
	09jDfGn3j43UpMVBEuMkxhcYniX893mtC6bbKodnkGzhufQMJADwApaiXbEGUo/a38GN
	6Typlyzv4C8j5f1hS3IyYRhBuX8/Q2KD2yzUns4dqvvvjGWTDsYK+Yit5PB23e5k9Csv
	kiw1r8VkCIXLsqCvk3MLsn/BPBV6gRJ5dHnhwb565DBzReUggBmgRtpy1dXdVpQOsilA
	HLZA==
X-Gm-Message-State: APjAAAWLxHY3uakLf5u/3J5PN64SlT3fMA4w+DrdlRDwAJRwmlMEa+8e
	JkVL3TrQT5lFqUuJBS9bVULVfg==
X-Google-Smtp-Source: APXvYqwy/fZXLgeDSXS8MB6n4hh9Ump+ILns1RyYBF25QdlYHm22iNJCOMA32625Bb8ggKG9bpa1gA==
X-Received: by 2002:a63:70f:: with SMTP id 15mr237119pgh.432.1559676902860;
	Tue, 04 Jun 2019 12:35:02 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
	by smtp.gmail.com with ESMTPSA id
	g17sm29008667pfb.56.2019.06.04.12.35.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Jun 2019 12:35:02 -0700 (PDT)
Message-ID: <5cf6c7e6.1c69fb81.e1551.8ac4@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <d6b4fb26-9a1b-0acd-ce4a-e48322a17e7d@collabora.com>
References: <20190221203334.24504-1-helen.koike@collabora.com>
	<5cf5a724.1c69fb81.1e8f0.08fb@mx.google.com>
	<d6b4fb26-9a1b-0acd-ce4a-e48322a17e7d@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, dm-devel@redhat.com
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Tue, 04 Jun 2019 12:35:01 -0700
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 04 Jun 2019 19:35:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 04 Jun 2019 19:35:03 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'swboyd@chromium.org' RCPT:''
X-RedHat-Spam-Score: -0.108  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <swboyd@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x54JZEQf015579
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 05 Jun 2019 04:13:38 -0400
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com,
	linux-doc@vger.kernel.org, richard.weinberger@gmail.com,
	linux-kernel@vger.kernel.org, linux-lvm@redhat.com,
	enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v12] dm: add support to directly boot to a
	mapped device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 05 Jun 2019 08:18:00 +0000 (UTC)

Quoting Helen Koike (2019-06-04 10:38:59)
> On 6/3/19 8:02 PM, Stephen Boyd wrote:
> > 
> > I'm trying to boot a mainline linux kernel on a chromeos device with dm
> > verity and a USB stick but it's not working for me even with this patch.
> > I've had to hack around two problems:
> > 
> >  1) rootwait isn't considered
> > 
> >  2) verity doesn't seem to accept UUID for <hash_dev> or <dev>
> > 
> > For the first problem, it happens every boot for me because I'm trying
> > to boot off of a USB stick and it's behind a hub that takes a few
> > seconds to enumerate. If I hack up the code to call dm_init_init() after
> > the 'rootdelay' cmdline parameter is used then I can make this work. It
> > would be much nicer if the whole mechanism didn't use a late initcall
> > though. If it used a hook from prepare_namespace() and then looped
> > waiting for devices to create when rootwait was specified it would work.
> 
> The patch was implemented with late initcall partially to be contained
> in drivers/md/*, but to support rootwait, adding a hook from
> prepare_namespace seems the way to go indeed.

Alright, great.

> 
> > 
> > The second problem is that in chromeos we have the bootloader fill out
> > the UUID of the kernel partition (%U) and then we have another parameter
> > that indicates the offset from that kernel partition to add to the
> > kernel partition (typically 1, i.e. PARTNROFF=1) to find the root
> > filesystem partition. The way verity seems to work here is that we need
> > to specify a path like /dev/sda3 or the major:minor number of the device
> > on the commandline to make this work. It would be better if we could add
> > in support for the PARTNROFF style that name_to_dev_t() handles so we
> > can specify the root partition like we're currently doing. I suspect we
> > should be able to add support for this into the device mapper layer so
> > that we can specify devices this way.
> 
> hmm, I didn't test this yet but at least from what I can see in the
> code, verity_ctr() calls dm_get_device() that ends up calling
> name_to_dev_t() which should take care of PARTNROFF, this requires a bit
> more investigation.
> 

Ok, thanks for pointing that out. Sorry I totally missed this codepath
and I should have investigated more. It works for me with the PARTNROFF
syntax that we've been using, so the problem is the rootwait stuff.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
