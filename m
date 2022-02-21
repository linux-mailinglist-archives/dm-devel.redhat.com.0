Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777B4BDAD6
	for <lists+dm-devel@lfdr.de>; Mon, 21 Feb 2022 17:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645461086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rPJruE724d7CQeAkw2r8vAH4SFaBVFphRvWKDRqq4G4=;
	b=L0k9dBdqhmdbEe1lWiApU0u9wPbXxqeGbaHcJOC/BTGKL5rPCkwdXNS6w2GWOx73Oxymhi
	9/Hdu2nEe+8q86pEfohKh8Cbr09DWK6ehjyoRHrU2VxITh/5lRuod9fpzUqfJDVYivmyJS
	m/oWjnz4KHmbE9MM/y1eN8M+RRzxq9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-rPrtGDyCPg-lU8Qo58VoPw-1; Mon, 21 Feb 2022 11:31:24 -0500
X-MC-Unique: rPrtGDyCPg-lU8Qo58VoPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10C17814243;
	Mon, 21 Feb 2022 16:31:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF1787747F;
	Mon, 21 Feb 2022 16:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5850E4A7C8;
	Mon, 21 Feb 2022 16:31:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21LGUsA9000648 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Feb 2022 11:30:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 500757D73C; Mon, 21 Feb 2022 16:30:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 385AF7D707;
	Mon, 21 Feb 2022 16:30:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 21LGUqEF002970; 
	Mon, 21 Feb 2022 10:30:52 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 21LGUqUw002969;
	Mon, 21 Feb 2022 10:30:52 -0600
Date: Mon, 21 Feb 2022 10:30:51 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220221163051.GR24684@octiron.msp.redhat.com>
References: <20220217195533.4251-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220217195533.4251-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/4] libmultipath: utter less dev_loss_tmo
	warnings
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

On Thu, Feb 17, 2022 at 08:55:29PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe,
> 
> since 3ab1f3b ("libmultipath: print message if setting dev_loss_tmo is unsupported"),
> multipathd prints a warning at level 2 for every map for which dev_loss_tmo can't
> be set. This results in a large number of warnings if there are many maps with such
> unsupported protocols, like this:
> 
> multipathd[1398]: 36001405328d6683b6cb4739943adf643: setting dev_loss_tmo is unsupported for protocol scsi:unspec
> 
> This patch set makes changes the code to print this warning only once per unsupported
> protocol. It would have been simpler to never print the warning more than once, but
> I figured that might suppress important information in some cases.
> 
> Regards
> Martin

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> Martin Wilck (4):
>   libmultipath: enable linear ordering of bus/proto tuple
>   libmultipath: use bus_protocol_id() in snprint_path_protocol()
>   libmultipath: enable defining a static bitfield
>   libmultipath: only warn once about unsupported dev_loss_tmo
> 
>  libmultipath/discovery.c |  4 ++-
>  libmultipath/print.c     | 58 +++++++++++++++-------------------------
>  libmultipath/structs.c   | 10 +++++++
>  libmultipath/structs.h   | 13 +++++++--
>  libmultipath/util.h      | 10 +++++++
>  5 files changed, 55 insertions(+), 40 deletions(-)
> 
> -- 
> 2.35.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

