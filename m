Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 43FDC14A0EA
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jan 2020 10:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580117673;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kHCbRGHlKtyloq4DjFMGTJRzdlvSZEx2ilsKINAhFNU=;
	b=EhoodO5MT0HMmsu1imwziE5A3JXfuPeZvZSHRWkfvI8KoEHQNInH9ouTLwqvRoeL9xn5sM
	8MGMScnsst5+Ds0+Mi8qrZRiXVkbTA3qWJJQ+wuct+rpk1A7cvSx/NGqXKEasAWRvSWLXc
	TbbNdsGfm0HCBEmqrQ3ITH0CL5AwxLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-UAoPGTXnMtyLWnAglKs_Fw-1; Mon, 27 Jan 2020 04:34:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599461800D41;
	Mon, 27 Jan 2020 09:34:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB44C5C1D6;
	Mon, 27 Jan 2020 09:34:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A069F18089C8;
	Mon, 27 Jan 2020 09:34:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00P2cngZ014655 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 21:38:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C41D121143; Sat, 25 Jan 2020 02:38:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 980D912113A
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 02:38:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DAAD8EB448
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 02:38:47 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-279-dGPoO8qzPoe7_DODLh6goQ-1; Fri, 24 Jan 2020 21:38:43 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	00P2YD8j008807; Sat, 25 Jan 2020 02:38:21 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 2xksyqva0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jan 2020 02:38:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	00P2XZNe005587; Sat, 25 Jan 2020 02:38:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 2xratapu48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jan 2020 02:38:19 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00P2cGeB013620;
	Sat, 25 Jan 2020 02:38:16 GMT
Received: from [192.168.0.110] (/39.176.206.183)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 24 Jan 2020 18:38:16 -0800
To: Kirill Tkhai <ktkhai@virtuozzo.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.petersen@oracle.com,
	axboe@kernel.dk, agk@redhat.com, snitzer@redhat.com,
	dm-devel@redhat.com, song@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, Chaitanya.Kulkarni@wdc.com,
	darrick.wong@oracle.com, ming.lei@redhat.com, osandov@fb.com,
	jthumshirn@suse.de, minwoo.im.dev@gmail.com, damien.lemoal@wdc.com,
	andrea.parri@amarulasolutions.com, hare@suse.com, tj@kernel.org,
	ajay.joshi@wdc.com, sagi@grimberg.me, dsterba@suse.com,
	bvanassche@acm.org, dhowells@redhat.com, asml.silence@gmail.com
References: <157968992539.174869.7490844754165043549.stgit@localhost.localdomain>
	<157969068832.174869.10818825289800365633.stgit@localhost.localdomain>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <eb2a8ad1-5ac2-db7e-5e47-ee77e10fa49a@oracle.com>
Date: Sat, 25 Jan 2020 10:38:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <157969068832.174869.10818825289800365633.stgit@localhost.localdomain>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1911140001 definitions=main-2001250021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
	definitions=main-2001250021
X-MC-Unique: dGPoO8qzPoe7_DODLh6goQ-1
X-MC-Unique: UAoPGTXnMtyLWnAglKs_Fw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 Jan 2020 04:34:01 -0500
Subject: Re: [dm-devel] [PATCH v5 3/6] block: Introduce
 blk_queue_get_max_write_zeroes_sectors()
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

On 1/22/20 6:58 PM, Kirill Tkhai wrote:
> This introduces a new primitive, which returns max sectors
> for REQ_OP_WRITE_ZEROES operation.
> @op_flags is unused now, and it will be enabled in next patch.
> 
> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>  block/blk-core.c       |    2 +-
>  block/blk-merge.c      |    9 ++++++---
>  include/linux/blkdev.h |    8 +++++++-
>  3 files changed, 14 insertions(+), 5 deletions(-)
> 

Reviewed-by: Bob Liu <bob.liu@oracle.com>

> diff --git a/block/blk-core.c b/block/blk-core.c
> index ac2634bcda1f..2edcd55624f1 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -978,7 +978,7 @@ generic_make_request_checks(struct bio *bio)
>  			goto not_supported;
>  		break;
>  	case REQ_OP_WRITE_ZEROES:
> -		if (!q->limits.max_write_zeroes_sectors)
> +		if (!blk_queue_get_max_write_zeroes_sectors(q, bio->bi_opf))
>  			goto not_supported;
>  		break;
>  	default:
> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index 1534ed736363..467b292bc6e8 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -105,15 +105,18 @@ static struct bio *blk_bio_discard_split(struct request_queue *q,
>  static struct bio *blk_bio_write_zeroes_split(struct request_queue *q,
>  		struct bio *bio, struct bio_set *bs, unsigned *nsegs)
>  {
> +	unsigned int max_sectors;
> +
> +	max_sectors = blk_queue_get_max_write_zeroes_sectors(q, bio->bi_opf);
>  	*nsegs = 0;
>  
> -	if (!q->limits.max_write_zeroes_sectors)
> +	if (!max_sectors)
>  		return NULL;
>  
> -	if (bio_sectors(bio) <= q->limits.max_write_zeroes_sectors)
> +	if (bio_sectors(bio) <= max_sectors)
>  		return NULL;
>  
> -	return bio_split(bio, q->limits.max_write_zeroes_sectors, GFP_NOIO, bs);
> +	return bio_split(bio, max_sectors, GFP_NOIO, bs);
>  }
>  
>  static struct bio *blk_bio_write_same_split(struct request_queue *q,
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 23a5850f35f6..264202fa3bf8 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -988,6 +988,12 @@ static inline struct bio_vec req_bvec(struct request *rq)
>  	return mp_bvec_iter_bvec(rq->bio->bi_io_vec, rq->bio->bi_iter);
>  }
>  
> +static inline unsigned int blk_queue_get_max_write_zeroes_sectors(
> +		struct request_queue *q, unsigned int op_flags)
> +{
> +	return q->limits.max_write_zeroes_sectors;
> +}
> +
>  static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
>  						     unsigned int op_flags)
>  {
> @@ -1001,7 +1007,7 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
>  		return q->limits.max_write_same_sectors;
>  
>  	if (unlikely(op == REQ_OP_WRITE_ZEROES))
> -		return q->limits.max_write_zeroes_sectors;
> +		return blk_queue_get_max_write_zeroes_sectors(q, op_flags);
>  
>  	return q->limits.max_sectors;
>  }
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

