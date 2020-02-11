Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE0F158C81
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 11:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581416242;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZOwTrWdqs070wGcO4wiI3EW2wfbOQvycv77VTGXPS9U=;
	b=Fj5EcEXJKV4JsqF+PAEswj/TYy03MjBjn4va74td1WlOXPYtXDe2nNTWAe1YXTnbaeRPJb
	+jlC/XqCATToOjSaJdDurPVMFw3C8cIs4XbvDuy+IDr24HOJpTi4xVmf3BfWn3HmI9/1pN
	FQJMNGn5jHRCV0Qpq75h/oatQ61wPWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-9CXDBIbJOHOzsukxX0Celg-1; Tue, 11 Feb 2020 05:17:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E103189F762;
	Tue, 11 Feb 2020 10:17:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3035A82063;
	Tue, 11 Feb 2020 10:17:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9E24866D4;
	Tue, 11 Feb 2020 10:17:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BAGnbh016560 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 05:16:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A226D93C5; Tue, 11 Feb 2020 10:16:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85CABD7DEA
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 10:16:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5E7B802FEE
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 10:16:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-89-nVIZoVa2Pfmv32EzCMllww-1;
	Tue, 11 Feb 2020 05:16:44 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 42D85ADE2;
	Tue, 11 Feb 2020 10:16:43 +0000 (UTC)
Message-ID: <10f7773039b69ada2692a5361f54b0c704c0e1a2.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Tue, 11 Feb 2020 11:18:12 +0100
In-Reply-To: <f031e9fa9fdc4be08ee76a2d65ea2c99f8cf0fb3.camel@suse.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<f031e9fa9fdc4be08ee76a2d65ea2c99f8cf0fb3.camel@suse.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: nVIZoVa2Pfmv32EzCMllww-1
X-MC-Unique: 9CXDBIbJOHOzsukxX0Celg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01BAGnbh016560
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 00/17] Multipath patch dump
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

Hi Christophe,

On Tue, 2020-02-11 at 09:45 +0100, Martin Wilck wrote:
> 
> ACK for the series: Martin Wilck <mwilck@suse.com>
> 
> Ben and I agreed that he'll follow up with some minor fixes, but
> there's no reason to hold this back.

There are a number of conflicts between Ben's series and my previous
72-part series from October/November. Ben and I will sort this out.

Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

