Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CA5471D42F9
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 03:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589506402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pB+AQnaTtxo60T8i2FcBV0Lm15bzAnxexeXDBt/+dYI=;
	b=cFDWMyOuwSBHazwkP3sfU82Rh1XYdSRsy/TeaKMep8hhQplbUiDzAkAxs2CgZPEGVH73YX
	w6rCRB3dkjwmIE0JoiT7g+68jStjyLMDCzlgVD6AapUJXTN4Hijqssbq/DesFozmbs32it
	V01hGhBMrjQo6UkPcrQffZ4GzIkUC98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-IZE-YHHRPIO6iqaQ5TwKxA-1; Thu, 14 May 2020 21:33:20 -0400
X-MC-Unique: IZE-YHHRPIO6iqaQ5TwKxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEBD5107ACCA;
	Fri, 15 May 2020 01:33:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12BFD99ED;
	Fri, 15 May 2020 01:33:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C94614E9B4;
	Fri, 15 May 2020 01:33:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F1X9hJ001088 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 21:33:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67FEA5C1D6; Fri, 15 May 2020 01:33:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6F95C1D3;
	Fri, 15 May 2020 01:33:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04F1X5Ov006659; 
	Thu, 14 May 2020 20:33:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04F1X4po006658;
	Thu, 14 May 2020 20:33:04 -0500
Date: Thu, 14 May 2020 20:33:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200515013304.GU5907@octiron.msp.redhat.com>
References: <20200512203822.18910-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200512203822.18910-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] More minor libmultipath fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, May 12, 2020 at 10:38:20PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> this is a follow-up on yesterday's "Minor fixes for multipath-tools"
> series. It adds fixes for sporadic build failures I observed.
> The libsg move is a long-overdue cleanup.
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

For the set

> Regards
> Martin
> 
> Martin Wilck (2):
>   libmultipath: move libsg into libmultipath
>   multipath-tools Makefile: add install dependency
> 
>  Makefile                            | 4 ++++
>  libmultipath/Makefile               | 3 ++-
>  libmultipath/checkers/Makefile      | 6 +++---
>  libmultipath/{checkers => }/libsg.c | 0
>  libmultipath/{checkers => }/libsg.h | 0
>  libmultipath/prioritizers/Makefile  | 2 +-
>  6 files changed, 10 insertions(+), 5 deletions(-)
>  rename libmultipath/{checkers => }/libsg.c (100%)
>  rename libmultipath/{checkers => }/libsg.h (100%)
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

