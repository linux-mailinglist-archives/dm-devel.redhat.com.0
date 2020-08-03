Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 910AD23ABD1
	for <lists+dm-devel@lfdr.de>; Mon,  3 Aug 2020 19:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596477004;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FL5p1nax6euubcFw65yNbwkTNm1BA84irnW7I/4K7+s=;
	b=N1DathHRQPBurvwlibeZrNEzKxln03fVaD7834TUgRJXdTjDZxUyuwIp1i02LScoQXH4C5
	A5qOqMZvE1ZXHtoaneYsWfW6o1+ldV2xl/j8b3HYJqIo/IO64Tx09p8n/DU6fiLcv3swTT
	3S3icJMZkaFbZ7cCfAshVY29H6cOzaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-5b9lKeJcMACMkC5qxH6m1Q-1; Mon, 03 Aug 2020 13:49:59 -0400
X-MC-Unique: 5b9lKeJcMACMkC5qxH6m1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E27279EC2;
	Mon,  3 Aug 2020 17:49:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D93621001B2B;
	Mon,  3 Aug 2020 17:49:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E57F9A11B;
	Mon,  3 Aug 2020 17:49:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073HnnhH014500 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 13:49:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F8F459; Mon,  3 Aug 2020 17:49:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CAC11755E;
	Mon,  3 Aug 2020 17:49:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 073Hnigr021145; 
	Mon, 3 Aug 2020 12:49:44 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 073Hnimp021144;
	Mon, 3 Aug 2020 12:49:44 -0500
Date: Mon, 3 Aug 2020 12:49:44 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <20200803174944.GH19233@octiron.msp.redhat.com>
References: <db186a10-8244-c9cd-4da0-b03976ce48b9@huawei.com>
MIME-Version: 1.0
In-Reply-To: <db186a10-8244-c9cd-4da0-b03976ce48b9@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] [dm- devel][PATCH] vector: add lower bound check of
 E in VECTOR_SLOT
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Aug 03, 2020 at 10:41:48AM +0800, Zhiqiang Liu wrote:
> 
> In VECTOR_SLOT(V, E), we add the lower bound check of E.
> E cannot be less than zero.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/vector.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/vector.h b/libmultipath/vector.h
> index e16ec461..cdb94b24 100644
> --- a/libmultipath/vector.h
> +++ b/libmultipath/vector.h
> @@ -32,7 +32,7 @@ typedef struct _vector *vector;
> 
>  #define VECTOR_DEFAULT_SIZE 1
>  #define VECTOR_SIZE(V)   ((V) ? ((V)->allocated) / VECTOR_DEFAULT_SIZE : 0)
> -#define VECTOR_SLOT(V,E) (((V) && (E) < VECTOR_SIZE(V)) ? (V)->slot[(E)] : NULL)
> +#define VECTOR_SLOT(V,E) (((V) && (E) < VECTOR_SIZE(V) && (E) >= 0) ? (V)->slot[(E)] : NULL)
>  #define VECTOR_LAST_SLOT(V)   (((V) && VECTOR_SIZE(V) > 0) ? (V)->slot[(VECTOR_SIZE(V) - 1)] : NULL)
> 
>  #define vector_foreach_slot(v,p,i) \
> -- 
> 2.24.0.windows.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

