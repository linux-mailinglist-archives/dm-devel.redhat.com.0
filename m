Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 03A43109484
	for <lists+dm-devel@lfdr.de>; Mon, 25 Nov 2019 21:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574712194;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dGULbboKaJQMFUhBkwAXcopHjtPtLK9Xjqxydv2CU98=;
	b=b2UVn3SuPonW/hx8TFLw8zxTuPVhIaqSzaUCpm73m0bEseLbMwzRrrMJfIM6khAwU12KzI
	Xzj021qZnLqqPsADwTHOOeqWXzAQVwniDRQvTx9sIclsTuazIscnzjxflUT2Wyefc0ADZA
	OGHv6dzjV8cB2JPpl3dili4Uexbbu7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-7mS3pLvtMdmTHvXpke186w-1; Mon, 25 Nov 2019 15:03:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BB8110B7DB1;
	Mon, 25 Nov 2019 19:49:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45EBF605AD;
	Mon, 25 Nov 2019 19:48:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C672B1809567;
	Mon, 25 Nov 2019 19:48:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPJmUmG032079 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 14:48:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 377BD2166B2C; Mon, 25 Nov 2019 19:48:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 325152166B28
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 19:48:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CE3A801FC4
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 19:48:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-90-MbcCGyvmP2mdOe7fxxIG8w-1;
	Mon, 25 Nov 2019 14:48:25 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 2EFCDAE46;
	Mon, 25 Nov 2019 19:48:24 +0000 (UTC)
Message-ID: <329fd408ea605f1f14c0eebb46209fd3c46c3af8.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
To: Drew Hastings <dhastings@crucialwebhost.com>, dm-devel@redhat.com
Date: Mon, 25 Nov 2019 20:49:05 +0100
In-Reply-To: <CAN-y+EJOt=MRDEXCx9_U4zmDs+i9yXj364E4+z=xC=u8+Ao1PQ@mail.gmail.com>
References: <CAN-y+EJOt=MRDEXCx9_U4zmDs+i9yXj364E4+z=xC=u8+Ao1PQ@mail.gmail.com>
User-Agent: Evolution 3.34.1
MIME-Version: 1.0
X-MC-Unique: MbcCGyvmP2mdOe7fxxIG8w-1
X-MC-Unique: 7mS3pLvtMdmTHvXpke186w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAPJmUmG032079
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] multipath - unable to use multiple active paths at
 once, and deprecated example in docs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-22 at 13:27 -0700, Drew Hastings wrote:
> My use case doesn't lend itself well to multipathd, so I'm trying to
> implement multipathing with device mapper directly.
> 
> My only assumption is that the multipath features, in particular
> queue_mode bio, prevent this from behaving properly. If that is the
> case, why can this not be achieved with bios, as this is not a
> limitation of raid1 (which will load balance read IO to device mapper
> targets). I also believe this is the only feature option that is
> viable for me, since this multipath device is on top of device mapper
> targets.

I think you are seeing this FIXME:

https://elixir.bootlin.com/linux/v4.19.79/source/drivers/md/dm-mpath.c#L612

For your testing, perhaps you just remove that if(!pgpath) condition.

Regards,
Martin




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

