Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7F86AC8C9
	for <lists+dm-devel@lfdr.de>; Mon,  6 Mar 2023 17:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678121695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XIr4gv5rIMxQKFs+nyTPr1neaHobLNp+SxcaKR5OrEc=;
	b=THs6GhbFarmWqCY8YZP7q3WHxMqKzh7hE1HqxbYcNWlLuBoDHgb1Z1HnZOM8nAOtscPczn
	+WxafhogsFjUGOUrMQ6clPqHIadVInQPAvpfcB4lo9o8cTE8NFLUxsDfv4QJmtybvd4vmr
	t8kZEJYtt1KmvTiRxulZuX0ghFWLjQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-7JgMGK6ZPAWoJJeKl2vqtg-1; Mon, 06 Mar 2023 11:54:54 -0500
X-MC-Unique: 7JgMGK6ZPAWoJJeKl2vqtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78454858F09;
	Mon,  6 Mar 2023 16:54:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CDC64011AC8;
	Mon,  6 Mar 2023 16:54:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F0FFB19465B1;
	Mon,  6 Mar 2023 16:54:45 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F03A8194658C
 for <dm-devel@listman.corp.redhat.com>; Mon,  6 Mar 2023 16:54:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E3AFC4011AC8; Mon,  6 Mar 2023 16:54:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD06740C83B6;
 Mon,  6 Mar 2023 16:54:43 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 326GsgtQ009498;
 Mon, 6 Mar 2023 10:54:42 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 326Gsg4L009497;
 Mon, 6 Mar 2023 10:54:42 -0600
Date: Mon, 6 Mar 2023 10:54:41 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Brian Bunker <brian@purestorage.com>
Message-ID: <20230306165441.GK17327@octiron.msp.redhat.com>
References: <CAHZQxyJH1etLR5gHuWk4c6-ieioqA4GrJ173B60bnTppke58dw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHZQxyJH1etLR5gHuWk4c6-ieioqA4GrJ173B60bnTppke58dw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH] [PATCH] libmultipath: return 'ghost' state
 when port is in transition
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: device-mapper development <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 21, 2023 at 12:56:43PM -0800, Brian Bunker wrote:
> A test unit ready command sent on a path in standby state will not result
> in a failed path. The same should be true for a path in the
> transitioning state.
> 
> Signed-off-by: Brian Bunker brian@purestorage.com

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/checkers/tur.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/checkers/tur.c b/libmultipath/checkers/tur.c
> index 551dc4f0..fff7987b 100644
> --- a/libmultipath/checkers/tur.c
> +++ b/libmultipath/checkers/tur.c
> @@ -179,10 +179,11 @@ retry:
>                 else if (key == 0x2) {
>                         /* Not Ready */
>                         /* Note: Other ALUA states are either UP or DOWN */
> -                       if( asc == 0x04 && ascq == 0x0b){
> +                       if (asc == 0x04 &&
> +                           (ascq == 0x0b || ascq == 0x0a)) {
>                                 /*
>                                  * LOGICAL UNIT NOT ACCESSIBLE,
> -                                * TARGET PORT IN STANDBY STATE
> +                                * TARGET PORT IN STANDBY OR TRANSITION STATE
>                                  */
>                                 *msgid = CHECKER_MSGID_GHOST;
>                                 return PATH_GHOST;
> --
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

