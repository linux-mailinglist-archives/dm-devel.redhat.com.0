Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C79F12DE8F4
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 19:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608316628;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zGhWjOLZ6pKKoJFPlLWDD9ZI/I+wBgmNk5SUHK6XTF0=;
	b=hi5LgABTXbXpZ7vUxT5UaJi254wTk796FNpjuXowXTVj0kNuoYrVINeDUJdk+SZaBfR8DE
	EqzXGfKdHzCaY/+4rMKk8fKRXDD3J3T/6Zxdk/BwU7gtIJimBK/40mmjE6GAGba+0Xa1Ie
	L/RTGXmziwFSBx1JWOyXI7lW4BNSYTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-l8-tuSIDNBWzbtuaxaxWJQ-1; Fri, 18 Dec 2020 13:37:06 -0500
X-MC-Unique: l8-tuSIDNBWzbtuaxaxWJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B5E580364F;
	Fri, 18 Dec 2020 18:37:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A432C01B;
	Fri, 18 Dec 2020 18:37:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6F0D1809CA0;
	Fri, 18 Dec 2020 18:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIIas8q002030 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 13:36:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0F4C60C47; Fri, 18 Dec 2020 18:36:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD7F60C5F;
	Fri, 18 Dec 2020 18:36:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BIIarZY008494; 
	Fri, 18 Dec 2020 12:36:53 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BIIar6m008493;
	Fri, 18 Dec 2020 12:36:53 -0600
Date: Fri, 18 Dec 2020 12:36:52 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201218183652.GN3103@octiron.msp.redhat.com>
References: <20201217110018.3347-1-mwilck@suse.com>
	<20201217110018.3347-8-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201217110018.3347-8-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 7/7] libmultipath.version: add missing symbol
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 17, 2020 at 12:00:18PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The weightedpath prioritizer uses get_next_string(). I'd overlooked
> this before. This was found with the help of the previous patch.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/libmultipath.version | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index 751099d..2228f4e 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -275,3 +275,8 @@ LIBMULTIPATH_4.3.0 {
>  global:
>  	start_checker_thread;
>  } LIBMULTIPATH_4.2.0;
> +
> +LIBMULTIPATH_4.4.0 {
> +global:
> +	get_next_string;
> +} LIBMULTIPATH_4.3.0;
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

