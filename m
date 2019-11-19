Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9B820102F55
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 23:31:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574202672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mi682352uNbWSJsceHOuwf+o6Wy93b4CxAXOA8pHYdI=;
	b=LrdEyiRS2w7PlLCfEChpfRbzC8ZphaXAUxG7AZCWdbwoZ9Z2SGwqD9orjN9yu8V9TAyS1a
	LRuIFfc46HQJ58g9PKYBYCgXIM3fG8Xtn3s2H2jmCAx1ol7KryvuqWU1xNq7YEVfe/9iVH
	HAN4XBh+bQCx3atoVWNMprFwQwvc0SY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-fVMrXabiPxqDlDodPz446g-1; Tue, 19 Nov 2019 17:31:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E04B0801FA1;
	Tue, 19 Nov 2019 22:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B403A605C7;
	Tue, 19 Nov 2019 22:31:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54A4C4BB65;
	Tue, 19 Nov 2019 22:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMUwFp009195 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:30:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CB81010375F3; Tue, 19 Nov 2019 22:30:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 430761001E75;
	Tue, 19 Nov 2019 22:30:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id xAJMUsV3010945; 
	Tue, 19 Nov 2019 16:30:54 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id xAJMUrkc010944;
	Tue, 19 Nov 2019 16:30:53 -0600
Date: Tue, 19 Nov 2019 16:30:53 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191119223053.GO30153@octiron.msp.redhat.com>
References: <20191115143403.31692-1-martin.wilck@suse.com>
	<20191115143403.31692-3-martin.wilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20191115143403.31692-3-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Chongyun Wu <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>
Subject: Re: [dm-devel] [PATCH 2/5] libmultipath: dict.c: rename duplicate
 set_no_path_retry()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: fVMrXabiPxqDlDodPz446g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Nov 15, 2019 at 02:41:48PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
>=20
> We have two functions called set_no_path_retry(). Fix that by
> renaming the function in dict.c to no_path_retry_helper().
>=20
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/dict.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/libmultipath/dict.c b/libmultipath/dict.c
> index a90690fa..e8a5ecb2 100644
> --- a/libmultipath/dict.c
> +++ b/libmultipath/dict.c
> @@ -1099,7 +1099,7 @@ declare_mp_handler(pgfailback, set_pgfailback)
>  declare_mp_snprint(pgfailback, print_pgfailback)
> =20
>  static int
> -set_no_path_retry(vector strvec, void *ptr)
> +no_path_retry_helper(vector strvec, void *ptr)
>  {
>  =09int *int_ptr =3D (int *)ptr;
>  =09char * buff;
> @@ -1134,13 +1134,13 @@ print_no_path_retry(char * buff, int len, long v)
>  =09}
>  }
> =20
> -declare_def_handler(no_path_retry, set_no_path_retry)
> +declare_def_handler(no_path_retry, no_path_retry_helper)
>  declare_def_snprint(no_path_retry, print_no_path_retry)
> -declare_ovr_handler(no_path_retry, set_no_path_retry)
> +declare_ovr_handler(no_path_retry, no_path_retry_helper)
>  declare_ovr_snprint(no_path_retry, print_no_path_retry)
> -declare_hw_handler(no_path_retry, set_no_path_retry)
> +declare_hw_handler(no_path_retry, no_path_retry_helper)
>  declare_hw_snprint(no_path_retry, print_no_path_retry)
> -declare_mp_handler(no_path_retry, set_no_path_retry)
> +declare_mp_handler(no_path_retry, no_path_retry_helper)
>  declare_mp_snprint(no_path_retry, print_no_path_retry)
> =20
>  static int
> --=20
> 2.24.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

