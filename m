Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AFB4B80A4
	for <lists+dm-devel@lfdr.de>; Wed, 16 Feb 2022 07:28:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644992917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G0btGRdn8g8faxFre/PYIKEo67BnfcgU+G5sO9PskUo=;
	b=TU+lqYB/8SP1zx1LqXv8JcnCefPPShrHfzxahzaQo4ubADTRIQqXFRwwGS2mr2SQN52x7g
	CZA+701o3ndTW0YK3JHjeWip5ln9yA02r6DZWSxKfZluXS6iZqyb7fatJYxRr9W4+3092k
	5SZYijPVTisRXILkF8+fHe7C0Vdu3Ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-AaIsi5KFPDe_n-HnmoS3Og-1; Wed, 16 Feb 2022 01:28:33 -0500
X-MC-Unique: AaIsi5KFPDe_n-HnmoS3Og-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46579801B0E;
	Wed, 16 Feb 2022 06:28:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC57D5C2EF;
	Wed, 16 Feb 2022 06:28:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A54A61809C88;
	Wed, 16 Feb 2022 06:28:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21F8m0dh004412 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Feb 2022 03:48:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16E5E492D1F; Tue, 15 Feb 2022 08:48:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 127F548FB0C
	for <dm-devel@redhat.com>; Tue, 15 Feb 2022 08:48:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFFCB10B952F
	for <dm-devel@redhat.com>; Tue, 15 Feb 2022 08:47:59 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
	[209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-466-BHgmhKdZOXmR1xUSTypnyA-1; Tue, 15 Feb 2022 03:47:55 -0500
X-MC-Unique: BHgmhKdZOXmR1xUSTypnyA-1
Received: by mail-pj1-f71.google.com with SMTP id
	t12-20020a17090a448c00b001b9cbac9c43so1375739pjg.2
	for <dm-devel@redhat.com>; Tue, 15 Feb 2022 00:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+0eleqiUVBeAPaQGD2Q6ihFW/Z9JIAN0Kj0GeNRsLaA=;
	b=YnKijBtZhb9LxUQxD9EdC2Td620qrYjX3MyZN9HLhZ11l1Uj05EkpMT1YAdL6NkT2r
	2HIdAvFtzIWW0oHu7FYeAGzTKb6SD7Nmja9FquAA9AKkYp6YQGMejoWopktMRe+6JTny
	/v8h7KWXZtZSXb6n4/laGe4xDyUhPMzpfzgBZeMKCaTdtygvip4/1tzfTlyjYqnZk+x5
	cjOFO0suADpgqUL2+iETBz5kOMazCe3a+J5v6PYbDtdnPsw+Fh0E+lNFtln8C2AkhFwm
	m9f8SLFnvRPiiHnDTdsSt8ORaSdfpiXp1RYsXDIh8CguOpfQc9nmPIayMimG+7474cEf
	CnUw==
X-Gm-Message-State: AOAM533Zh5zVu3WMbdMCcHkU5g5DzgF93UK1kDycSEOd8bJ/XfU38aCN
	E0PM9Wd3yBHhFqZFFl0UWcjk/qHmtzJcQPHwSNBsk9BlqHrjp4w9pOrjBs2ZF37U+yQQV9EZq6E
	/zVTtQmDzUJuibh5Y12l6yQXAywyrj5o=
X-Received: by 2002:a05:6a00:9a9:: with SMTP id
	u41mr3233709pfg.83.1644914874668; 
	Tue, 15 Feb 2022 00:47:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1RXfHqGKUOwHiOd9TXDCmkRfLOApnv8+NP4UBdUIs2zHseVmQ3Z770IwhZgE/Zg1NSmgYeteqUdN9fAOzix8=
X-Received: by 2002:a05:6a00:9a9:: with SMTP id
	u41mr3233676pfg.83.1644914874405; 
	Tue, 15 Feb 2022 00:47:54 -0800 (PST)
MIME-Version: 1.0
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
	<1644890154-64915-6-git-send-email-wangqing@vivo.com>
In-Reply-To: <1644890154-64915-6-git-send-email-wangqing@vivo.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 15 Feb 2022 09:47:43 +0100
Message-ID: <CAO-hwJJK5yeW+K_vLpWV9t3TsEdk0xCO-ETxeJsXM2c117JzNw@mail.gmail.com>
To: Qing Wang <wangqing@vivo.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 16 Feb 2022 01:28:09 -0500
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, David Airlie <airlied@linux.ie>,
	Michael Turquette <mturquette@baylibre.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil@xs4all.nl>, dm-devel@redhat.com,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-clk@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
	amd-gfx@lists.freedesktop.org,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	xen-devel@lists.xenproject.org, linux-media@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	intel-gfx@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Stephen Boyd <sboyd@kernel.org>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, lkml <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [dm-devel] [PATCH V3 5/13] hid: use time_is_after_jiffies()
 instead of open coding it
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 15, 2022 at 2:56 AM Qing Wang <wangqing@vivo.com> wrote:
>
> From: Wang Qing <wangqing@vivo.com>
>
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

FWIW, this one is
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Wang, is there any plan to take this series through the trivial tree
or should each maintainer take the matching patches?

Cheers,
Benjamin

> ---
>  drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
> index 8ccb246..15e1423
> --- a/drivers/hid/intel-ish-hid/ipc/ipc.c
> +++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
> @@ -578,7 +578,7 @@ static void _ish_sync_fw_clock(struct ishtp_device *dev)
>         static unsigned long    prev_sync;
>         uint64_t        usec;
>
> -       if (prev_sync && jiffies - prev_sync < 20 * HZ)
> +       if (prev_sync && time_is_after_jiffies(prev_sync + 20 * HZ))
>                 return;
>
>         prev_sync = jiffies;
> --
> 2.7.4
>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

