Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB74140EE8
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 17:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579278374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u7YnbeTEUjeiT7a40PhE2poz9M4WPGKC0d/sBji4BA4=;
	b=GQchpiQ7wMlZhskV+EDmBTLAho0JZHvMtF+RUl1t3wyKATntptxSfz7/Tl2oUDLjN0StGT
	HK2Bnspq2Crva/TOb2rWFeXd/Vw/ZVjBsvBQHpt20/tF3dKPC7CpLFArkhXUA4wexYdEdx
	d8jsD1MnJnqzSpMCQIHSG34PQvCvfEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-X6svVe1yMIqvdaZozaurIQ-1; Fri, 17 Jan 2020 11:26:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D553C800D4E;
	Fri, 17 Jan 2020 16:26:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C1CF7DB38;
	Fri, 17 Jan 2020 16:26:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 090C687091;
	Fri, 17 Jan 2020 16:25:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HGPpAr020148 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 11:25:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C7552026D68; Fri, 17 Jan 2020 16:25:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8607C2093CE5
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 16:25:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 535F28E683C
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 16:25:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-180-BRoJ1tqzNGWfMwDA_qLuSA-1;
	Fri, 17 Jan 2020 11:25:45 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id DC519AAC2;
	Fri, 17 Jan 2020 16:25:43 +0000 (UTC)
Message-ID: <42675e7de2ed4c56762438e2cae803da8de9118e.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 17:27:00 +0100
In-Reply-To: <1579227500-17196-8-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-8-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: BRoJ1tqzNGWfMwDA_qLuSA-1
X-MC-Unique: X6svVe1yMIqvdaZozaurIQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HGPpAr020148
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 07/15] libmultipath: fix sgio_get_vpd looping
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> If do_inq returns a page with a length that is less than maxlen, but
> larger than DEFAULT_SGIO_LEN, this function will loop forever. Also
> if do_inq returns with a length equal to or greater than maxlen,
> sgio_get_vpd will exit immediately, even if it hasn't read the entire
> page.  Fix these issues, modify the tests to verify the new behavior.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/discovery.c | 12 +++---
>  tests/vpd.c              | 84 ++++++++++++++++++++++++------------
> ----
>  2 files changed, 57 insertions(+), 39 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 72f455e8..3c72a80a 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -870,6 +870,7 @@ static int
>  sgio_get_vpd (unsigned char * buff, int maxlen, int fd, int pg)
>  {
>  	int len = DEFAULT_SGIO_LEN;
> +	int rlen;
>  
>  	if (fd < 0) {
>  		errno = EBADF;
> @@ -877,12 +878,11 @@ sgio_get_vpd (unsigned char * buff, int maxlen,
> int fd, int pg)
>  	}
>  retry:
>  	if (0 == do_inq(fd, 0, 1, pg, buff, len)) {
> -		len = get_unaligned_be16(&buff[2]) + 4;
> -		if (len >= maxlen)
> -			return len;
> -		if (len > DEFAULT_SGIO_LEN)
> -			goto retry;
> -		return len;
> +		rlen = get_unaligned_be16(&buff[2]) + 4;
> +		if (rlen <= len || len >= maxlen)
> +			return rlen;
> +		len = (rlen < maxlen)? rlen : maxlen;
> +		goto retry;
>  	}
>  	return -1;
>  }

This looks good.

> diff --git a/tests/vpd.c b/tests/vpd.c
> index d9f80eaa..4dbce010 100644
> --- a/tests/vpd.c
> +++ b/tests/vpd.c
> @@ -306,7 +306,7 @@ static int create_vpd83(unsigned char *buf,
> size_t bufsiz, const char *id,
>  	default:
>  		break;
>  	}
> -	put_unaligned_be16(n, buf + 2);
> +	put_unaligned_be16(bufsiz, buf + 2);
>  	return n + 4;
>  }

I can see that you are trying to create a VPD with a certain given
length. But this way you intentionally create a VPD that doesn't
conform to the spec (offset 2 should contain the real length of the
designator list, not some arbitrary value). This is dangerous, in the
future someone may copy this code thinking that it creates a valid
VPD. At least you should add a big fat comment. Better even, you
should leave out this hunk and override the length value in the
actual test (make_test_vpd_eui) if (sml == 1) (and also add a comment).

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

