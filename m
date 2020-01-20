Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1E37D142F7E
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jan 2020 17:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579537396;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nqWgiDd91YZ6AIogqzZaFyWY+9/gQ8td4w9fNYdbM/8=;
	b=RuEoFjBjf4Vu8QNrmzneNAtYmfSWIHSHiPlOaVIbi1BNYP6p4srnoYJO+20rEx/NOIPcJ/
	rO3IbnRYMH017/wxwf/i048KUso6PjA65WVaMaRpd4U02lkjeq68bjrtFXMNt3FU3pOGgb
	pi24rlsDYujt/i1l5yxhM4V0PgLQo04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-Y8R-pr66P6i50uO5BdaDMw-1; Mon, 20 Jan 2020 11:23:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B6ED18B9F75;
	Mon, 20 Jan 2020 16:23:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D45785727;
	Mon, 20 Jan 2020 16:23:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F2BC8197F;
	Mon, 20 Jan 2020 16:23:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KGMrhw023939 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 11:22:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 388AD860EB; Mon, 20 Jan 2020 16:22:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A44EC7C3D9;
	Mon, 20 Jan 2020 16:22:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00KGMnq5010144; 
	Mon, 20 Jan 2020 10:22:49 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00KGMnpO010143;
	Mon, 20 Jan 2020 10:22:49 -0600
Date: Mon, 20 Jan 2020 10:22:48 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200120162248.GR30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-12-git-send-email-bmarzins@redhat.com>
	<7b276f0772bf9aeb92d3af16e3072f717de5318e.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <7b276f0772bf9aeb92d3af16e3072f717de5318e.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/15] libmultipath: change failed path prio
	timeout
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
X-MC-Unique: Y8R-pr66P6i50uO5BdaDMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jan 17, 2020 at 06:18:46PM +0100, Martin Wilck wrote:
> On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> This changes the unit of the first get_prio_timeout() argument from
> seconds to milliseconds. While that's a good thing (it was questionable
> design to have the same function take several "timeout" arguments in
> different units), we should rename the argument there to avoid
> confusion (checker_timeout's unit is seconds all around).

Sure.

-Ben

> 
> Apart from that, ACK.
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

