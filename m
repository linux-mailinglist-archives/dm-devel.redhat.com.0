Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 332FD24F53
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 14:54:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2F23356DA;
	Tue, 21 May 2019 12:54:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07A0C665F4;
	Tue, 21 May 2019 12:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C0E51806B0E;
	Tue, 21 May 2019 12:53:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LCpnI2022203 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 08:51:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 566CF51C60; Tue, 21 May 2019 12:51:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 408BC176D4;
	Tue, 21 May 2019 12:51:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3710219DCB;
	Tue, 21 May 2019 12:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=;
	b=FeDWO975fNC3Rwlp1Ik8IumWR
	KElWZeU1FzJFkbHDOrfiz4kprdOImDn1SnpES/LvZkL47QoeeS928tvMlNHtFxLNqacnWa4pUiRBZ
	N4/qAAn5bOcw9POmiVKbzP7b5oJ4Ta/dbyQ7Xstfn5wS8M9VOUIU5N4dWzSbZKZK/BolPttr14R47
	qhGoKWpDxPejsZo3Ruwq4cSICjl1nMu+dupmhpkVxDUI7B9FXdN3BNkqqhYeMJAqyOqTGCSsJcxv2
	GlN+wMlHHpG6+QCevouBZKRYhvS14WFh6JQmebgLYMgfdgXAxMSY+YLEwnH9BK6OQwdAvGKLfC9KL
	8wInl9RsA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hT4Eq-0007jp-Fk; Tue, 21 May 2019 12:51:28 +0000
Date: Tue, 21 May 2019 05:51:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Message-ID: <20190521125128.GA16799@infradead.org>
References: <20190520220911.25192-1-gpiccoli@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520220911.25192-1-gpiccoli@canonical.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Tue, 21 May 2019 12:51:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 21 May 2019 12:51:35 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+dd3a5481af7880b59d64+5749+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+dd3a5481af7880b59d64+5749+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>, kernel@gpiccoli.net,
	stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Eric Ren <renzhengeek@gmail.com>, jay.vosburgh@canonical.com,
	gavin.guo@canonical.com
Subject: Re: [dm-devel] [PATCH V2 1/2] block: Fix a NULL pointer dereference
 in generic_make_request()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 21 May 2019 12:54:45 +0000 (UTC)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
