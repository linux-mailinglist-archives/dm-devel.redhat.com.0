Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4575A4467FC
	for <lists+dm-devel@lfdr.de>; Fri,  5 Nov 2021 18:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636133704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uMSzA68Qxl8Y/TpSx/qfsEYEuA3F0RQ+oK/PmHrfZGw=;
	b=RywIqBUGaSq3ui5jY2DLHrH0GYUoBiHxEh/E6bF69silpEcUaczv+wXXaLCCw3xfp7XuG8
	xK8fuVVX8j4qHisuNJnzla4+CXLV53YcyKhc0k0WJFIL0Ma24OR1Vd1w4eSntai1rk5QPY
	rfsGoLfdekbzdZIKQbTvyq/4jKEMjgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-CYYKQ4xhNzKhwpH-qJ6uDQ-1; Fri, 05 Nov 2021 13:35:02 -0400
X-MC-Unique: CYYKQ4xhNzKhwpH-qJ6uDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C3CA10168CD;
	Fri,  5 Nov 2021 17:34:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37DD283925;
	Fri,  5 Nov 2021 17:34:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CAF9180BAD1;
	Fri,  5 Nov 2021 17:34:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A5HSRxK006338 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Nov 2021 13:28:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0151B1B5B7; Fri,  5 Nov 2021 17:28:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 190D260936;
	Fri,  5 Nov 2021 17:28:24 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1A5HSKxs011734; 
	Fri, 5 Nov 2021 12:28:21 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1A5HSKnk011733;
	Fri, 5 Nov 2021 12:28:20 -0500
Date: Fri, 5 Nov 2021 12:28:19 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211105172819.GF19591@octiron.msp.redhat.com>
References: <1633550663-25571-1-git-send-email-bmarzins@redhat.com>
	<1633550663-25571-2-git-send-email-bmarzins@redhat.com>
	<3214cb1e9be6070086dfada89deef4c7977de9e0.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <3214cb1e9be6070086dfada89deef4c7977de9e0.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/8] libmulitpath: add section name to
 invalid keyword output
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 04, 2021 at 08:55:39PM +0000, Martin Wilck wrote:
> On Wed, 2021-10-06 at 15:04 -0500, Benjamin Marzinski wrote:
> > If users forget the closing brace for a section in multipath.conf,
> > multipath has no way to detect that. When it sees the keyword at the
> > start of the next section, it will complain that there is an invalid
> > keyword, because that keyword doesn't belong in previous section
> > (which
> > was never ended with a closing brace). This can confuse users. To
> > make
> > this easier to understand, when multipath prints and invalid keyword
> > message, it now also prints the current section name, which can give
> > users a hint that they didn't end the previous section.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Apart from typo in the subject:

Oops. I'll fix that.

-Ben

> 
> Reviewed-by: Martin Wilck <mwilck@suse.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

