Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5E71B7B3D
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 18:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587744811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jOUIjqQKdQqEMx2bl6eDXrxRi04vbe2pyjnWzib8IGM=;
	b=Teo1KGyyjzCqDnfON3QnGHEJUaGCLBzfGr52c2LLeoM7l4pi0Z/ccvmmrKgUL2T+Azs7db
	kQhgRRdEM3ePARQ/eVGkUqEVynssOIPHA9An1NbQL9v5tHwmrVgyWGO+/qti1UHTgY8r/9
	eZrx2W6QxYTWXU7NpNUZcD7aTE91+ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-puh3SkD1NfedYb_amtStHg-1; Fri, 24 Apr 2020 12:13:29 -0400
X-MC-Unique: puh3SkD1NfedYb_amtStHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00F8D1005510;
	Fri, 24 Apr 2020 16:13:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA95B5C1D2;
	Fri, 24 Apr 2020 16:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCCEF1809542;
	Fri, 24 Apr 2020 16:13:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OGCxMg016251 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 12:12:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 752372166BA0; Fri, 24 Apr 2020 16:12:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D562156A22
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 16:12:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29A308007C8
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 16:12:42 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-340-gdxl_YbxM9a0_qpQqduE7A-1; Fri, 24 Apr 2020 12:12:52 -0400
X-MC-Unique: gdxl_YbxM9a0_qpQqduE7A-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03OG8l29007799; Fri, 24 Apr 2020 16:12:31 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 30jvq520ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2020 16:12:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03OG80UM097904; Fri, 24 Apr 2020 16:12:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 30k7qxebdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2020 16:12:29 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03OGCSfa031602;
	Fri, 24 Apr 2020 16:12:28 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 24 Apr 2020 09:12:27 -0700
To: Ming Lei <ming.lei@redhat.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200424102351.475641-1-ming.lei@redhat.com>
	<20200424102351.475641-3-ming.lei@redhat.com>
Date: Fri, 24 Apr 2020 12:12:25 -0400
In-Reply-To: <20200424102351.475641-3-ming.lei@redhat.com> (Ming Lei's message
	of "Fri, 24 Apr 2020 18:23:42 +0800")
Message-ID: <yq1v9loeuc6.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9601
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	spamscore=0 mlxlogscore=653
	adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004240125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9601
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 malwarescore=0
	mlxscore=0 adultscore=0 mlxlogscore=712 phishscore=0 impostorscore=0
	clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004240125
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03OGCxMg016251
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	Bart Van Assche <bvanassche@acm.org>, Mike Snitzer <snitzer@redhat.com>,
	John Garry <john.garry@huawei.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V8 02/11] block: add helper for copying
	request
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Ming,

> Add one new helper of blk_rq_copy_request() to copy request, and the
> helper will be used in this patch for re-submitting request, so make
> it as a block layer internal helper.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

