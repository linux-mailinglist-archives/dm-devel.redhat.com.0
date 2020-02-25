Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6253316F26B
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 23:03:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582668220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yznr/uO9gJmaoESgTAv/te+jjDPRi44LUiuVFE30hdY=;
	b=SlkMfRjmEX9VOS4RS8QqbKu/5o/1QWKXhpL4R8Hqq2+YVzjFYWfNmldsK+OWsqcUUDWwth
	gRdR+um5tnN+MDm925STTzruu+2qZWTo3UXw/0zUWkEhQMASvsoJG2/F5gqr/+C1m6fkMg
	T0dj9oY+w+TnH6QqBEmOiFyBuMSw2GM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-Kp3M6az3MjevfaJ9hvtZbg-1; Tue, 25 Feb 2020 17:03:38 -0500
X-MC-Unique: Kp3M6az3MjevfaJ9hvtZbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82FB218A5508;
	Tue, 25 Feb 2020 22:03:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AE4660E1C;
	Tue, 25 Feb 2020 22:03:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFAD08B2DA;
	Tue, 25 Feb 2020 22:03:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PM3AkE011936 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 17:03:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E4CDB51DC; Tue, 25 Feb 2020 22:03:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0D7417881
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 22:03:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C749B185A78E
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 22:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467--TrQfoojMuyBoF6jtLo-SA-1; Tue, 25 Feb 2020 17:03:02 -0500
X-MC-Unique: -TrQfoojMuyBoF6jtLo-SA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6iI2-0005zL-LO; Tue, 25 Feb 2020 22:02:54 +0000
Date: Tue, 25 Feb 2020 14:02:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Message-ID: <20200225220254.GA13356@infradead.org>
References: <20200225170744.10485-1-dg@emlix.com>
	<20200225191222.GA3908@infradead.org>
	<a932a297-266e-4dee-f030-40ecbc9899ca@emlix.com>
MIME-Version: 1.0
In-Reply-To: <a932a297-266e-4dee-f030-40ecbc9899ca@emlix.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PM3AkE011936
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm integrity: reinitialize __bi_remaining
 when reusing bio
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 25, 2020 at 08:54:07PM +0100, Daniel Gl=F6ckner wrote:
> bio_reset will reset too many fields. As you can see in the context of
> the diff, dm-integrity expects f.ex. the values modified by bio_advance
> to stay intact and the transfer should of course use the same disk and
> operation.
>=20
> How about doing the atomic_set in bio_remaining_done (in block/bio.c)
> where the BIO_CHAIN flag is cleared once __bi_remaining hits zero?
> Or is requeuing a bio without bio_reset really a no-go? In that case a
> one-liner won't do...

That tends to add a overhead to the fast path for a rather exotic
case.  I'm having a bit of a hard time understanding the dm-integrity
code due to it's annoyingly obsfucated code, but it seems like it
tries to submit a bio again after it came out of a ->end_io handler.
That might have some other problems, but if we only want to paper
over the remaining count a isngle call to bio_inc_remaining might be all
you need.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

