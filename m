Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DFCD622302B
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jul 2020 03:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594947992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZrR2U+OHz7WKqZ/+35dodlNcIpycQbm/jXpCsck/3TQ=;
	b=Q3qYIoQvaQNrx2adyU2Mvvja1Lrms6KwXzjloVi9LLOxdiMWYS6qCvErgIXI7pe3KW+7NV
	DHOI+hAuDI7/4IbMSL/EDnpqRt0VbNptHLyVkNe6MYs+mT+1EftAQyPLCso3mt7rFxeUe/
	tSZuQrd8oAT06yFTZcKQCFEbaX3WMcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-yYldXbaiOieAlmV6-aSkIA-1; Thu, 16 Jul 2020 21:06:30 -0400
X-MC-Unique: yYldXbaiOieAlmV6-aSkIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64E2F106B242;
	Fri, 17 Jul 2020 01:06:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBA2C74F70;
	Fri, 17 Jul 2020 01:06:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4E071809554;
	Fri, 17 Jul 2020 01:06:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06H15wp2009866 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 21:05:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65FAE72AC8; Fri, 17 Jul 2020 01:05:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E415372AC7;
	Fri, 17 Jul 2020 01:05:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06H15r6Q024087; 
	Thu, 16 Jul 2020 20:05:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06H15rUV024086;
	Thu, 16 Jul 2020 20:05:53 -0500
Date: Thu, 16 Jul 2020 20:05:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200717010552.GO11089@octiron.msp.redhat.com>
References: <20200709101952.7285-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709101952.7285-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/39] multipath-tools series part II:
	dev_loss_tmo fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:19:48PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> This is part II of a larger patch series for multpath-tools I've been preparing.
> It contains some minor fixes for dev_loss_tmo handling, mostly logging.
> It's based on the previously submitted part I.
> 
> The full series will also be available here:
> https://github.com/mwilck/multipath-tools/tree/ups/submit-2007
> 
> There are tags in that repo for each part of the series.
> This part is tagged "submit-200709-2".
> 
> Regards,
> Martin
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
for the part.

> 
> Martin Wilck (4):
>   libmultipath: add macro DEV_LOSS_TMO_UNSET
>   libmultipath: improve logging for dev_loss_tmo override
>   libmultipath: print message if setting dev_loss_tmo is unsupported
>   libmultipath: increase log level of limiting dev_loss_tmo
> 
>  libmultipath/defaults.h  |  1 +
>  libmultipath/dict.c      |  4 +--
>  libmultipath/discovery.c | 56 ++++++++++++++++++++++++++++++----------
>  libmultipath/propsel.c   |  2 +-
>  4 files changed, 46 insertions(+), 17 deletions(-)
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

