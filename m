Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C211A27
	for <lists+dm-devel@lfdr.de>; Thu,  2 May 2019 15:28:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 838045F79C;
	Thu,  2 May 2019 13:28:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5847D608A5;
	Thu,  2 May 2019 13:28:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F347B18089CA;
	Thu,  2 May 2019 13:27:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x42DRNYH006411 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 May 2019 09:27:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5C15608C9; Thu,  2 May 2019 13:27:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF748608E8
	for <dm-devel@redhat.com>; Thu,  2 May 2019 13:27:18 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA78CC06647C
	for <dm-devel@redhat.com>; Thu,  2 May 2019 13:27:17 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id f187so1967932wme.5
	for <dm-devel@redhat.com>; Thu, 02 May 2019 06:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=klk9BfNLobZFzvvv3RWonkuC3y07XDsJxgsitF+PBMI=;
	b=XfYqdzsTYmQntL2P3mnmfmRNU5lENLznwta37b2ex/ixRK/ksFQxF5+3SD7CfeBBcS
	i1cwk21OsLlz9CVNQ6Rq9aJ5YXIb8vhpE5PcZAqWnwdjHO7eDFquY+7Ql74IWGjPLb6W
	Co0QvkNm+/NERCw7ZBr5sgEy8Dra8VOQvkVGTmjqo/M12bhbzH3c85UaqM9w0yy/FgTz
	z8R1MJMzuvOCvDNIEhMtsyJ0E2TZTkJ4gG+xv+84wqciXkY6KW5XY6mjKTA42PK7nqf5
	dyOeUfuK/VdpbKyHKUSJLAlt1+1ejcgRyizOEdsmPgFGboUphc1exdc9tJXZYlgwLxyN
	6JYA==
X-Gm-Message-State: APjAAAW5W2pnJhn3vRItLn2m6TpQmlKXULL7FoR7zpxwRsVuAp/dnxek
	f9zxkUzVNBv6C0rbuWVhebPwB/mtGcX4mqVR56/bkdnLOp22VvkohzpYNNJpH49SE3dVqKWTPMz
	tdAIA8BT+Et2lfOSL/X+ONww2P8Hrrt8=
X-Received: by 2002:a5d:548d:: with SMTP id h13mr2948856wrv.218.1556803636393; 
	Thu, 02 May 2019 06:27:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwqgHiTGnc/CUv5ctBzIs+Lutqt2xj3BHihx/LSigv+LRUxs2dNE20e+3GgBpSacsfbpEzd2l4Oe6+XZAb8TE=
X-Received: by 2002:a5d:548d:: with SMTP id h13mr2948846wrv.218.1556803636210; 
	Thu, 02 May 2019 06:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190501125717.5695-1-colin.king@canonical.com>
In-Reply-To: <20190501125717.5695-1-colin.king@canonical.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Thu, 2 May 2019 09:27:05 -0400
Message-ID: <CAHhmqcTRVWBNnynaAJ7mbtke-MCiBma-6z_=bYrFzh0ubky-Fw@mail.gmail.com>
To: Colin King <colin.king@canonical.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kernel-janitors@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH][next] dm: remove redundant unsigned
 comparison to less than zero
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 02 May 2019 13:28:05 +0000 (UTC)

On Wed, May 1, 2019 at 8:58 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable block is an unsigned long long hence the less than zero
> comparison is always false, hence it is redundant and can be removed.
>
> Addresses-Coverity: ("Unsigned compared against 0")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/md/dm-dust.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> index 178587bdc626..e739092bfc65 100644
> --- a/drivers/md/dm-dust.c
> +++ b/drivers/md/dm-dust.c
> @@ -411,7 +411,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
>
>                 block = tmp;
>                 sector_div(size, dd->sect_per_block);
> -               if (block > size || block < 0) {
> +               if (block > size) {
>                         DMERR("selected block value out of range");
>                         return result;
>                 }
> --
> 2.20.1
>

Thanks.

There was already a check before that to ensure that the argument
feeding this variable is an unsigned long long; if it isn't, it will
fail with EINVAL:

# dmsetup message -- dust1 0 queryblock -1
device-mapper: message ioctl on dust1  failed: Invalid argument
Command failed

Reviewed-by: Bryan Gurney <bgurney@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
