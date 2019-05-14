Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7BD1C062
	for <lists+dm-devel@lfdr.de>; Tue, 14 May 2019 03:38:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65B1E3087926;
	Tue, 14 May 2019 01:38:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C13CD1001F54;
	Tue, 14 May 2019 01:38:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11FFF41F58;
	Tue, 14 May 2019 01:38:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4E1bMM6023549 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 21:37:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FF8C5C21F; Tue, 14 May 2019 01:37:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64C735C1B4;
	Tue, 14 May 2019 01:37:20 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CBD083F51;
	Tue, 14 May 2019 01:37:19 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k24so12196882qtq.7;
	Mon, 13 May 2019 18:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SOOeaKMfw8I0MoiLwEapADtrXGn7pkhV0kap6ZwQVDI=;
	b=HibJBWcd5fNtFy3dxGVSTMny3QlEzBW7sojDuTKzkZICspt0QMxzQlk2MahyCp0lVt
	nkGFODLkNk7BMSA/Xbo27hzTtDWKf0LlyQps9VVAIUK0hh0LbLk3P4vDVpSSMyZxqRQ1
	ZyShH8xVWk5x3UEAvW+2f1rdSdPwDl+Tyl4jZo6YdNPy7E7JQJ4nDSzZvRhesJpvRbS1
	Ygz9/z1lUkAiroY8RbYOn5T+Nmo0/0EUQeVqSjrtWFW+dnB+gTHinouDGz8xfqrgHrHG
	vFhLVujQechPkBFoNmO3m1CVAWmUJFZ26hUNhAboAabZfJPED7N/a2TbSfcmUml9Fg7X
	1G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SOOeaKMfw8I0MoiLwEapADtrXGn7pkhV0kap6ZwQVDI=;
	b=Nv4ORArpHuxfzQ8es6XrHkMpuu+/AfC+4nYVwpNk3s7lIVWM9WgPFQulHJmeVmnJ9m
	HtwPGqzpMr9GqX8CMHVbW75/kT/A1EUqSjjDEip0Yb9SD598MaV5S5foKuMcfi6t5UzI
	HYP+uhGhyTJvg+IMqMUaw/y5Fj6BCzkqHTNdiJnZgUlEKPlK8AjhmQLCs6/S8GYey9E9
	CZWLKQzt8dsNnDw+pTWlWTov8bv03z3aOgHYFt0fddG5pwpARTKBEYNz/HOxpejkmYwj
	7AG1wx38HVZkQMFCNpRlEoYBLYYFXkkFLWZuPy2nMEez8ZRC/Ylc2310QV7V7OcUAJsn
	3epQ==
X-Gm-Message-State: APjAAAUHeEQ8GkTPc7+4yuoeLFlsWBLrsfKDn4l/CGCrZgbh3Lsll8DJ
	I+gGcPLrCkiWmqNiWZyNCLg=
X-Google-Smtp-Source: APXvYqx59YutmMKXaNr3D4cWZm83/Tz4GquDTc15cehb6DgVneMJGcUPloa/Q4XA8id6LKgMl4bYdA==
X-Received: by 2002:ac8:2687:: with SMTP id 7mr4387486qto.325.1557797838761;
	Mon, 13 May 2019 18:37:18 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id z8sm8208376qth.62.2019.05.13.18.37.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 18:37:17 -0700 (PDT)
Date: Mon, 13 May 2019 21:37:16 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Helen Koike <helen.koike@collabora.com>
Message-ID: <20190514013716.GA10260@lobo>
References: <20190513192530.1167-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513192530.1167-1-helen.koike@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 May 2019 01:37:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 14 May 2019 01:37:19 +0000 (UTC) for IP:'209.85.160.196'
	DOMAIN:'mail-qt1-f196.google.com'
	HELO:'mail-qt1-f196.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.006  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_PASS) 209.85.160.196 mail-qt1-f196.google.com 209.85.160.196
	mail-qt1-f196.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kernel@collabora.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm ioctl: fix hang in early create error condition
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 14 May 2019 01:38:47 +0000 (UTC)

On Mon, May 13 2019 at  3:25P -0400,
Helen Koike <helen.koike@collabora.com> wrote:

> The dm_early_create() function (which deals with "dm-mod.create=" kernel
> command line option) calls dm_hash_insert() who gets an extra reference
> to the md object.
> 
> In case of failure, this reference wasn't being released, causing
> dm_destroy() to hang, thus hanging the whole boot process.
> 
> Fix this by calling __hash_remove() in the error path.
> 
> Fixes: 6bbc923dfcf57d ("dm: add support to directly boot to a mapped device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> Hi,
> 
> I tested this patch by adding a new test case in the following test
> script:
> 
> https://gitlab.collabora.com/koike/dm-cmdline-test/commit/d2d7a0ee4a49931cdb59f08a837b516c2d5d743d
> 
> This test was failing, but with this patch it works correctly.
> 
> Thanks
> Helen

Thanks for the patch but I'd prefer the following simpler fix.  What do
you think?

That said, I can provide a follow-on patch (inspired by the patch you
provided) that encourages more code sharing between dm_early_create()
and dev_create() by factoring out __dev_create().

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index c740153b4e52..0eb0b462c736 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -2117,6 +2117,7 @@ int __init dm_early_create(struct dm_ioctl *dmi,
 err_destroy_table:
 	dm_table_destroy(t);
 err_destroy_dm:
+	(void) __hash_remove(__find_device_hash_cell(dmi));
 	dm_put(md);
 	dm_destroy(md);
 	return r;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
