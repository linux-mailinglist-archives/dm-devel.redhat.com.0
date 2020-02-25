Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E840616EF1D
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 20:35:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582659352;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cfm76uZe3onm+1b06R+gHER6jgXL53bbbltwbIYhpvo=;
	b=Dq2UmcKNZqeZEBZDRlOUF82+TRdDKJGT1YJkcAHTQzJ3LeUSmbzvLYf3HWfAlvYTpDgqmN
	ZBiVW9B66NNcTQ0H4jOy4+OMxjPQX3d94/KXlzGxJsyepH1J8MteXdwkN+QUucQB8z+WRG
	I/fZOSY2qRzeXYePlipigH2XVP0DQ8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465--EkxJ-c_OGKPa95qRvNkoA-1; Tue, 25 Feb 2020 14:35:50 -0500
X-MC-Unique: -EkxJ-c_OGKPa95qRvNkoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C1E10509B9;
	Tue, 25 Feb 2020 19:35:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98B388C066;
	Tue, 25 Feb 2020 19:35:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B01B1803C33;
	Tue, 25 Feb 2020 19:35:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PJZGr5002448 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 14:35:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C5B542166B27; Tue, 25 Feb 2020 19:35:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC46E2166B2A
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 19:35:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFC0D800299
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 19:35:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-143-8ROmZpuzOhWQZvh9GmV4QA-1; Tue, 25 Feb 2020 14:35:10 -0500
X-MC-Unique: 8ROmZpuzOhWQZvh9GmV4QA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6fd0-0001Yv-M6; Tue, 25 Feb 2020 19:12:22 +0000
Date: Tue, 25 Feb 2020 11:12:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Message-ID: <20200225191222.GA3908@infradead.org>
References: <20200225170744.10485-1-dg@emlix.com>
MIME-Version: 1.0
In-Reply-To: <20200225170744.10485-1-dg@emlix.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PJZGr5002448
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 25, 2020 at 06:07:44PM +0100, Daniel Gl=F6ckner wrote:
> In cases where dec_in_flight has to requeue the integrity_bio_wait work
> to transfer the rest of the data, the __bi_remaining field of the bio
> might already have been decremented to zero. Reusing the bio without
> reinitializing that counter to 1 can then result in integrity_end_io
> being called too early when the BIO_CHAIN flag is set, f.ex. due to
> blk_queue_split. In our case this triggered the BUG() in
> blk_mq_end_request when the hardware signalled completion of the bio
> after integrity_end_io had modified it.
>=20
> Signed-off-by: Daniel Gl=F6ckner <dg@emlix.com>

Drivers have no business poking into these internals.  If a bio is
reused the caller needs to use bio_reset instead.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

