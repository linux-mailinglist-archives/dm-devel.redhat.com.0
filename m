Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 077901B7B43
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 18:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587744883;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=md1Avhy4pQkPz0sjO/v0qACi9GDmL70ijdpvAVKMeHc=;
	b=ev6dhpBz30VLpd37Ckzkuy3ZDZk5H0mOyLTbJNGSAi5LdiVHVix3Zns+6lxPsT5DtmMttn
	YQMX8H/+IdKalW9l7UP+Pg3upX2rqY5zPMe4CXxXXeXoel1DfxUSOIxV3JiZ4gv2Dsw976
	uX064g/svTrot8WklEkh8dPutD6sLvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-dQSDcH1QOVqVJJtR0MfXyg-1; Fri, 24 Apr 2020 12:14:30 -0400
X-MC-Unique: dQSDcH1QOVqVJJtR0MfXyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1884E1007B08;
	Fri, 24 Apr 2020 16:14:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7535C1D0;
	Fri, 24 Apr 2020 16:14:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 556934CAA0;
	Fri, 24 Apr 2020 16:14:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OGEE3X016316 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 12:14:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 164BF60606; Fri, 24 Apr 2020 16:14:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast03.extmail.prod.ext.phx2.redhat.com [10.5.110.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09C2760605
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 16:14:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D57819057A1
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 16:14:11 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-148-f4mufoOAPiWUSjFhUvcKWw-1; Fri, 24 Apr 2020 12:12:01 -0400
X-MC-Unique: f4mufoOAPiWUSjFhUvcKWw-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03OG9EOi055412; Fri, 24 Apr 2020 16:11:38 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 30k7qe7rjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2020 16:11:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03OG80bq097859; Fri, 24 Apr 2020 16:11:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 30k7qxea9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2020 16:11:37 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03OGBYM9031155;
	Fri, 24 Apr 2020 16:11:34 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 24 Apr 2020 09:11:34 -0700
To: Ming Lei <ming.lei@redhat.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200424102351.475641-1-ming.lei@redhat.com>
	<20200424102351.475641-2-ming.lei@redhat.com>
Date: Fri, 24 Apr 2020 12:11:31 -0400
In-Reply-To: <20200424102351.475641-2-ming.lei@redhat.com> (Ming Lei's message
	of "Fri, 24 Apr 2020 18:23:41 +0800")
Message-ID: <yq1zhb0eudo.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9601
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	spamscore=0 mlxlogscore=999
	adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004240125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9601
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	lowpriorityscore=0
	priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
	impostorscore=0 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004240125
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03OGEE3X016316
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	Bart Van Assche <bvanassche@acm.org>, Mike Snitzer <snitzer@redhat.com>,
	John Garry <john.garry@huawei.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V8 01/11] block: clone nr_integrity_segments
	and write_hint in blk_rq_prep_clone
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

> So far blk_rq_prep_clone() is only used for setup one underlying
> cloned request from dm-rq request. block intetrity can be enabled for
> both dm-rq and the underlying queues, so it is reasonable to clone
> rq's nr_integrity_segments. Also write_hint is from bio, it should
> have been cloned too.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

