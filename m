Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254F35863
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 10:18:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C919D5D672;
	Wed,  5 Jun 2019 08:17:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B97C5C22B;
	Wed,  5 Jun 2019 08:17:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80E60206D3;
	Wed,  5 Jun 2019 08:17:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x53N3CDN001696 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Jun 2019 19:03:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1896607B7; Mon,  3 Jun 2019 23:03:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBA9D5D9CC
	for <dm-devel@redhat.com>; Mon,  3 Jun 2019 23:03:10 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBE08820E2
	for <dm-devel@redhat.com>; Mon,  3 Jun 2019 23:03:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x15so1657602pfq.0
	for <dm-devel@redhat.com>; Mon, 03 Jun 2019 16:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=message-id:mime-version:content-transfer-encoding:in-reply-to
	:references:cc:to:from:subject:user-agent:date;
	bh=M0Hol1AOy0PKp1c8t8OnpXkvg1N8/Tmp5x6wPCFFMsw=;
	b=Xfn13xPJjjwbLXR9uug3Z3G6LQb+xBE4ONBMi76WHafAXU8u3CBRtuKcEB+IYyRXLD
	df0YOzJAgsBizPo4j8K2kObvDFTIa00ANWFb0BsDU0KgNxuBCjcQy0Ye0Glb5SZ8I7Uy
	d0e1kVim0sDFhNYzBkTSEazmw7ZzArabm1gNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:mime-version
	:content-transfer-encoding:in-reply-to:references:cc:to:from:subject
	:user-agent:date;
	bh=M0Hol1AOy0PKp1c8t8OnpXkvg1N8/Tmp5x6wPCFFMsw=;
	b=pc5d1Fsq1QNOVOjH7Q6RX6UqGUBTk7IEOnW8xuVdoa+KFZcCbDJnS654mUZZt0q91k
	opAg+N+2thjYvq4Q8AThrj2mRZ3SI/M6iLhlM7Lzckj3kZ/1wuPFr5XKombXxNJp8WZa
	/MsMaIRiCwKmYFR1vgD6Nc8C3DTpzLCe2i4gOhelb6jTyh2tqnwlqhjoD54PTWkLbNx+
	Mxz0lkYiUcT4nGQ/I94rgAGINOih5wHa3dbIXhXHu6EHGo3jzRZZKrHzuy50/WiFGM/m
	v81g7cOs9Tr8DLKPy8MIwhuvgzyMHHM2Ene7Xt1Q/eXOry6ZebEpSLwJ8enm148OwcTq
	eVPw==
X-Gm-Message-State: APjAAAUTfSV4tsgfEwgOdZrSn4tY4E+XGw9cr/+njCm1W6GjEoNY2wYn
	76FXGKLtFa6E1yFNP2Ic663kCw==
X-Google-Smtp-Source: APXvYqxm7Ws5lscObY+oPn1h3+ONhLwXf8YRLVndDfYmndsXiVoHaByRfk1oBLv+cxwcrRXvWyohLg==
X-Received: by 2002:a63:6c87:: with SMTP id
	h129mr32302973pgc.427.1559602981281; 
	Mon, 03 Jun 2019 16:03:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
	by smtp.gmail.com with ESMTPSA id
	c142sm17390174pfb.171.2019.06.03.16.03.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jun 2019 16:03:00 -0700 (PDT)
Message-ID: <5cf5a724.1c69fb81.1e8f0.08fb@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190221203334.24504-1-helen.koike@collabora.com>
References: <20190221203334.24504-1-helen.koike@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, dm-devel@redhat.com
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Mon, 03 Jun 2019 16:02:59 -0700
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 03 Jun 2019 23:03:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 03 Jun 2019 23:03:02 +0000 (UTC) for IP:'209.85.210.193'
	DOMAIN:'mail-pf1-f193.google.com'
	HELO:'mail-pf1-f193.google.com' FROM:'swboyd@chromium.org' RCPT:''
X-RedHat-Spam-Score: -0.118  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE, SPF_PASS,
	T_DKIMWL_WL_HIGH) 209.85.210.193 mail-pf1-f193.google.com
	209.85.210.193 mail-pf1-f193.google.com <swboyd@chromium.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x53N3CDN001696
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 05 Jun 2019 08:18:02 +0000 (UTC)

Quoting Helen Koike (2019-02-21 12:33:34)
> Add a "create" module parameter, which allows device-mapper targets to be
> configured at boot time. This enables early use of dm targets in the boot
> process (as the root device or otherwise) without the need of an initramfs.
> 
> The syntax used in the boot param is based on the concise format from the
> dmsetup tool to follow the rule of least surprise:
> 
>         sudo dmsetup table --concise /dev/mapper/lroot
> 
> Which is:
>         dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
> 
> Where,
>         <name>          ::= The device name.
>         <uuid>          ::= xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | ""
>         <minor>         ::= The device minor number | ""
>         <flags>         ::= "ro" | "rw"
>         <table>         ::= <start_sector> <num_sectors> <target_type> <target_args>
>         <target_type>   ::= "verity" | "linear" | ...
> 
> For example, the following could be added in the boot parameters:
> dm-mod.create="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
> 
> Only the targets that were tested are allowed and the ones that doesn't
> change any block device when the dm is create as read-only. For example,
> mirror and cache targets are not allowed. The rationale behind this is
> that if the user makes a mistake, choosing the wrong device to be the
> mirror or the cache can corrupt data.
> 
> The only targets allowed are:
> * crypt
> * delay
> * linear
> * snapshot-origin
> * striped
> * verity
> 
> Co-developed-by: Will Drewry <wad@chromium.org>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 

I'm trying to boot a mainline linux kernel on a chromeos device with dm
verity and a USB stick but it's not working for me even with this patch.
I've had to hack around two problems:

 1) rootwait isn't considered

 2) verity doesn't seem to accept UUID for <hash_dev> or <dev>

For the first problem, it happens every boot for me because I'm trying
to boot off of a USB stick and it's behind a hub that takes a few
seconds to enumerate. If I hack up the code to call dm_init_init() after
the 'rootdelay' cmdline parameter is used then I can make this work. It
would be much nicer if the whole mechanism didn't use a late initcall
though. If it used a hook from prepare_namespace() and then looped
waiting for devices to create when rootwait was specified it would work.

The second problem is that in chromeos we have the bootloader fill out
the UUID of the kernel partition (%U) and then we have another parameter
that indicates the offset from that kernel partition to add to the
kernel partition (typically 1, i.e. PARTNROFF=1) to find the root
filesystem partition. The way verity seems to work here is that we need
to specify a path like /dev/sda3 or the major:minor number of the device
on the commandline to make this work. It would be better if we could add
in support for the PARTNROFF style that name_to_dev_t() handles so we
can specify the root partition like we're currently doing. I suspect we
should be able to add support for this into the device mapper layer so
that we can specify devices this way.

If it helps, an example commandline I've been using to test out a usb
stick is as follows:

dm-mod.create="vroot,,0,ro, 0 4710400 verity 0 8:19 8:19 4096 4096 588800 588800 sha1 9b0a223aedbf74b06442b0f05fbff33c55edd010 414b21fba60a1901e23aec373e994942e991d6762631e54a39bc42411f244bd2"

Also, the documentation (Documentation/device-mapper/dm-init.txt) says
we can use a way that doesn't specify so many arguments, but dm verity
complains about not enough arguments (10) when following the example:

  vroot,,,ro,
  0 1740800 verity 254:0 254:0 1740800 sha1
  76e9be054b15884a9fa85973e9cb274c93afadb6
  5b3549d54d6c7a3837b9b81ed72e49463a64c03680c47835bef94d768e5646fe;    

So the documentation needs an update?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
