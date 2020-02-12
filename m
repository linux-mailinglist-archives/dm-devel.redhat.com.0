Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C147115B216
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 21:46:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581540384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0jtoMJe1FRFaf+n9yqus4vBHUgleCrIwRwQAUPIcuDA=;
	b=YH29I+ijAWghDuYPvczH8Edxp9H3NlIPQCph7Y/VLhS03DiRTJadcteDz+9yXjyoLjiTeo
	kYaZ3lPaAET9gvf8GHSAsL987EPrwJJ7gtejUPfaBFmJ7F+VSKMhpP5vmfWf2jnSzwJV6K
	z8pWMDg1NYzik6ssfQASFtiy2tpBXpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-msNK2x8LOM-s1-juJ_giBQ-1; Wed, 12 Feb 2020 15:46:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4979800D48;
	Wed, 12 Feb 2020 20:46:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A3B60BF1;
	Wed, 12 Feb 2020 20:46:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B5658B2AA;
	Wed, 12 Feb 2020 20:46:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CKjiDR014827 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 15:45:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1AD4D2166B29; Wed, 12 Feb 2020 20:45:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1660B2166B28
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 20:45:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C32A18AE94F
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 20:45:41 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-bh55Qv1HPfy1qzGuwd9ZpA-1; Wed, 12 Feb 2020 15:45:36 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01CKhHe8063973; Wed, 12 Feb 2020 20:45:14 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 2y2p3snbhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 12 Feb 2020 20:45:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01CKhIoX032957; Wed, 12 Feb 2020 20:45:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2y4k9gd1rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2020 20:45:10 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01CKj2Z4000618;
	Wed, 12 Feb 2020 20:45:02 GMT
Received: from localhost (/10.159.151.237)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 12 Feb 2020 12:45:02 -0800
Date: Wed, 12 Feb 2020 12:44:59 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <20200212204459.GP6874@magnolia>
References: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
	<158132724397.239613.16927024926439560344.stgit@localhost.localdomain>
	<20200212170156.GM6874@magnolia>
	<f108e700-62fb-6ecd-2bba-0ab7a6b9ef7b@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <f108e700-62fb-6ecd-2bba-0ab7a6b9ef7b@virtuozzo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9529
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	suspectscore=0 spamscore=0
	adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002120142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9529
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	mlxscore=0 malwarescore=0
	suspectscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
	impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
	bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002120142
X-MC-Unique: bh55Qv1HPfy1qzGuwd9ZpA-1
X-MC-Unique: msNK2x8LOM-s1-juJ_giBQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01CKjiDR014827
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, bob.liu@oracle.com, minwoo.im.dev@gmail.com,
	jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com, sagi@grimberg.me,
	axboe@kernel.dk, damien.lemoal@wdc.com, tytso@mit.edu,
	martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
	tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v6 6/6] loop: Add support for REQ_ALLOCATE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 12, 2020 at 11:00:15PM +0300, Kirill Tkhai wrote:
> On 12.02.2020 20:01, Darrick J. Wong wrote:
> > On Mon, Feb 10, 2020 at 12:34:04PM +0300, Kirill Tkhai wrote:
> >> Support for new modifier of REQ_OP_WRITE_ZEROES command.
> >> This results in allocation extents in backing file instead
> >> of actual blocks zeroing.
> >>
> >> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> >> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> >> ---
> >>  drivers/block/loop.c |   15 ++++++++++++---
> >>  1 file changed, 12 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> >> index 739b372a5112..bfe76d9adf09 100644
> >> --- a/drivers/block/loop.c
> >> +++ b/drivers/block/loop.c
> >> @@ -581,6 +581,15 @@ static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
> >>  	return 0;
> >>  }
> >>  
> >> +static unsigned int write_zeroes_to_fallocate_mode(unsigned int flags)
> >> +{
> >> +	if (flags & REQ_ALLOCATE)
> >> +		return 0;
> >> +	if (flags & REQ_NOUNMAP)
> >> +		return FALLOC_FL_ZERO_RANGE;
> >> +	return FALLOC_FL_PUNCH_HOLE;
> >> +}
> >> +
> >>  static int do_req_filebacked(struct loop_device *lo, struct request *rq)
> >>  {
> >>  	struct loop_cmd *cmd = blk_mq_rq_to_pdu(rq);
> >> @@ -604,9 +613,7 @@ static int do_req_filebacked(struct loop_device *lo, struct request *rq)
> >>  		 * write zeroes the range.  Otherwise, punch them out.
> >>  		 */
> > 
> > Please update this comment to reflect the new REQ_ALLOCATE mode, and
> > move it to where you define write_zeroes_to_fallocate_mode().
> > 
> > With that fixed,
> > 
> > Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Just to clarify. Is this "Reviewed-by:" tag for this patch or for the whole series?

Only that patch.

--D

> Kirill


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

