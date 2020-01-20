Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D3B2A14305C
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jan 2020 18:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579539631;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1qMysmypGe7hSKWUYuMAc8biVxvsHncjYg/wuuVoqbU=;
	b=Fa1280+A621nnzXlL84CitmWTtm0WzlYq+6VO7P8fAuJ5kc+Q1sJDC7SMaIH/iTKSTnFIX
	DgBQbe08bBlNgwqwLIpf62MB2209IjUWBCA8xjOXqSM+4hsbbHPY54W+WmP5Fdl/P9uVGN
	m2dX3vAO1P11tKVD7WprWwK2ben2rNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-LYhZQJzKPxyGqROjiC0rAQ-1; Mon, 20 Jan 2020 12:00:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3C61DBB1;
	Mon, 20 Jan 2020 17:00:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 700D4194B2;
	Mon, 20 Jan 2020 17:00:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C977318089CF;
	Mon, 20 Jan 2020 17:00:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KGxwT0027261 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 11:59:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B0D305D9E1; Mon, 20 Jan 2020 16:59:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 379215D9D6;
	Mon, 20 Jan 2020 16:59:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00KGxtij010363; 
	Mon, 20 Jan 2020 10:59:55 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00KGxs5g010362;
	Mon, 20 Jan 2020 10:59:54 -0600
Date: Mon, 20 Jan 2020 10:59:54 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200120165954.GT30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-8-git-send-email-bmarzins@redhat.com>
	<42675e7de2ed4c56762438e2cae803da8de9118e.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <42675e7de2ed4c56762438e2cae803da8de9118e.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: LYhZQJzKPxyGqROjiC0rAQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jan 17, 2020 at 05:27:00PM +0100, Martin Wilck wrote:
> On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> 
> > diff --git a/tests/vpd.c b/tests/vpd.c
> > index d9f80eaa..4dbce010 100644
> > --- a/tests/vpd.c
> > +++ b/tests/vpd.c
> > @@ -306,7 +306,7 @@ static int create_vpd83(unsigned char *buf,
> > size_t bufsiz, const char *id,
> >  	default:
> >  		break;
> >  	}
> > -	put_unaligned_be16(n, buf + 2);
> > +	put_unaligned_be16(bufsiz, buf + 2);
> >  	return n + 4;
> >  }
> 
> I can see that you are trying to create a VPD with a certain given
> length. But this way you intentionally create a VPD that doesn't
> conform to the spec (offset 2 should contain the real length of the
> designator list, not some arbitrary value). This is dangerous, in the
> future someone may copy this code thinking that it creates a valid
> VPD. At least you should add a big fat comment. Better even, you
> should leave out this hunk and override the length value in the
> actual test (make_test_vpd_eui) if (sml == 1) (and also add a comment).

Sure.

-Ben

> 
> Regards
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

