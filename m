Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EF9D8F2B85
	for <lists+dm-devel@lfdr.de>; Thu,  7 Nov 2019 10:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573120461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=evl/Hui1z6h7In9c0QpMXib4sArm59yjNtz9F1UTvgw=;
	b=C12sbb33n23ScznlbK11/7aDlyWiSTHq9Ei0pjXpY6NualzieRVthmxwcMABHN75wT0WJE
	wsTI4vLVbfmIRyqNIwF9JpSTwwEkIpHFAY720BmZZcQknxCubhostyOqScB9PMBuVy19cg
	m1pRejh86CNnEMrG4yDYKuvQ3lVfWCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-15YmCoDWPyyaOgknbB5IAA-1; Thu, 07 Nov 2019 04:54:19 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 270412B4;
	Thu,  7 Nov 2019 09:54:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E9119C6A;
	Thu,  7 Nov 2019 09:54:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DC8718089CD;
	Thu,  7 Nov 2019 09:54:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA79s9Lm014575 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 04:54:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B5E55DA2C; Thu,  7 Nov 2019 09:54:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0D45DA32;
	Thu,  7 Nov 2019 09:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C30324E8B8;
	Thu,  7 Nov 2019 09:54:03 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iSeUM-0002nh-DM; Thu, 07 Nov 2019 09:54:02 +0000
Date: Thu, 7 Nov 2019 01:54:02 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191107095402.GG2024@infradead.org>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<20191027140549.26272-9-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191027140549.26272-9-damien.lemoal@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Thu, 07 Nov 2019 09:54:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 07 Nov 2019 09:54:03 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+7ccf0c60396084899c9c+5919+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+7ccf0c60396084899c9c+5919+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Ajay Joshi <ajay.joshi@wdc.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 8/8] null_blk: add zone open, close,
	and finish support
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
X-MC-Unique: 15YmCoDWPyyaOgknbB5IAA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

