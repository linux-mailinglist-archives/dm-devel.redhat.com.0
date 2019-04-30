Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C8146C7
	for <lists+dm-devel@lfdr.de>; Mon,  6 May 2019 10:50:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0481430842B5;
	Mon,  6 May 2019 08:50:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E77D1BC41;
	Mon,  6 May 2019 08:50:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC73918089CB;
	Mon,  6 May 2019 08:50:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UMVhj8016549 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 18:31:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F00D6D0AD; Tue, 30 Apr 2019 22:31:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 094506D0A7
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 22:31:40 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F27981F13
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 22:31:40 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w24so7418347plp.2
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yfF5H9sXdYGfRkgjeUEgFTpI/com9Yw+RoJM20k2Mo8=;
	b=a6SA3kY9w7hdAa1fPmp0gfn6vQWFW4190viuCtta0fylIwg7wnbDQLdVWLIpxWfVt5
	I5ReElLYpF9ZiYEyEWT7sAQHE/B0rWttkMZdIH7zo87WO5vLbHrtETl1nkG4/SZKgEEc
	jvPdEv2C1LIXjMkxgKtdMR5wZ+0Hhj7dbDR7yIO3PpH3vHKPkVv86DLAaOx2TG+zn5sa
	Jw4kCEa1PhqW/Iq4vmQHrvaqEwzTId4PaZQc8V5VQ/iyX+lHvrATh8B08myM636TFPtD
	btmQIH5g36ec7za7lqxVsRiq8XNiqxHl1OCA2lyJeWv6lNj8OPbxcW7Itm5PznVYY8AW
	qiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yfF5H9sXdYGfRkgjeUEgFTpI/com9Yw+RoJM20k2Mo8=;
	b=Z4NgIx1VjqVlOsl8HOSqT68H3Hkch6Tn8a2oVCLOnGZ76YiyeNED+Y6Zc0sn3mOk6f
	qERYthcg0mNQakU5B2xliMvSUDZ/ehB+FWLSaRCqkm5HaahFlhyk94PGsdD2iWzK55S9
	Am3ZRKKSrkLowI7hOw98ist8lfZ8mwHzs+8tqGiKBZKC/AQSaZUb76GL6vzFAmMsg6a9
	HqPSr36bDESjZZOLke7dIHamwG/sz9Wz2Ji7DzMNR0bk3pZWjoTdlMU4zSNb3pbWRH0X
	hY6GHqo1JTp30Z027oIsqj55PMFJbTA94IGWrCZuwpZ355zY5qadGKoQL5NnFJmYz5Z4
	q4lA==
X-Gm-Message-State: APjAAAWnbhlZyQSJ04dTg1JEIfnnrqe/RybypcoZuxJCCJ5Qi3I7LFCd
	A9aQIm7HAyqOaZq4SDNMhz+BE71HxOawToT9YXMt7w==
X-Google-Smtp-Source: APXvYqwhJoBXedgaM/wlibXyF1IvVjm7pE3LY5oa/mMkvOuh3boz3I/pIIGAmuhePDCUR2hcUoxR9ol2Cw2SRdBepnk=
X-Received: by 2002:a17:902:4383:: with SMTP id
	j3mr2195280pld.320.1556663499039; 
	Tue, 30 Apr 2019 15:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190430021010.25151-1-natechancellor@gmail.com>
In-Reply-To: <20190430021010.25151-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 30 Apr 2019 15:31:27 -0700
Message-ID: <CAKwvOdkNMnwRC9UO_cJq+e9+x5DHE0Nw0guzThxU_RX5obfSPQ@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 30 Apr 2019 22:31:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 30 Apr 2019 22:31:40 +0000 (UTC) for IP:'209.85.214.194'
	DOMAIN:'mail-pl1-f194.google.com'
	HELO:'mail-pl1-f194.google.com' FROM:'ndesaulniers@google.com'
	RCPT:''
X-RedHat-Spam-Score: -15.61  (DKIMWL_WL_MED, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_PASS,
	USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL) 209.85.214.194 mail-pl1-f194.google.com
	209.85.214.194 mail-pl1-f194.google.com
	<ndesaulniers@google.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 May 2019 04:49:36 -0400
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH] dm dust: Convert an 'else if' into an 'else'
	in dust_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 06 May 2019 08:50:31 +0000 (UTC)

On Mon, Apr 29, 2019 at 7:10 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When building with -Wsometimes-uninitialized, Clang warns:
>
> drivers/md/dm-dust.c:216:11: warning: variable 'ret' is used
> uninitialized whenever 'if' condition is false
> [-Wsometimes-uninitialized]
>         else if (bio_data_dir(bio) == WRITE)
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/bio.h:69:2: note: expanded from macro 'bio_data_dir'
>         (op_is_write(bio_op(bio)) ? WRITE : READ)
>         ^
> drivers/md/dm-dust.c:219:9: note: uninitialized use occurs here
>         return ret;
>                ^~~
> drivers/md/dm-dust.c:216:7: note: remove the 'if' if its condition is
> always true
>         else if (bio_data_dir(bio) == WRITE)
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/md/dm-dust.c:209:9: note: initialize the variable 'ret' to
> silence this warning
>         int ret;
>                ^
>                 = 0
> 1 warning generated.
>
> It isn't wrong; however, bio_data_dir will only ever return READ and
> WRITE so the second 'else if' can really become an 'else' to silence
> this warning and not change the final meaning of the code.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/462
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/md/dm-dust.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> index 997830984893..5baeb56679ed 100644
> --- a/drivers/md/dm-dust.c
> +++ b/drivers/md/dm-dust.c
> @@ -213,7 +213,7 @@ static int dust_map(struct dm_target *ti, struct bio *bio)
>
>         if (bio_data_dir(bio) == READ)
>                 ret = dust_map_read(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
> -       else if (bio_data_dir(bio) == WRITE)
> +       else
>                 ret = dust_map_write(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
>
>         return ret;
> --
> 2.21.0
>

Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
