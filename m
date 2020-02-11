Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D82841659BD
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189579;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QkZVOuyZMspDY4vXLIWfBqTOGwXKJ2M4YhSCCAYU1Zc=;
	b=De0CN1G8g6yZ95pvIFmw1MY21TSBaqyyB7GvmgqkO/2SBvowl5sQNOgVk5XGAQMZCWyXm4
	CUbH2TGKDc//r6NbGDcDK7Bo1PXFeTwZktt4xN+5Vs2lAmQhNzZqmrgY6YTHaIljLOMcdd
	w5S+Miyvkh97w0gY+KYD0ZXLlro6LeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-9s_tLrUGNeKbyg8zG0WBrw-1; Thu, 20 Feb 2020 04:06:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD13D100550E;
	Thu, 20 Feb 2020 09:06:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A4BA90064;
	Thu, 20 Feb 2020 09:06:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BDF2180203B;
	Thu, 20 Feb 2020 09:06:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BFqXvp007492 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 10:52:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B3C0510ABC86; Tue, 11 Feb 2020 15:52:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEEFB10ABC8A
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 15:52:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B4D88EB47D
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 15:52:31 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-4zfBSHO_MS-bjywY46Eh-g-1; Tue, 11 Feb 2020 10:52:28 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	01BFq0Ar125097
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 10:52:28 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2y1u9qcswx-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 10:52:24 -0500
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <dm-devel@redhat.com> from <gerald.schaefer@de.ibm.com>;
	Tue, 11 Feb 2020 15:50:00 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 11 Feb 2020 15:49:57 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 01BFnusZ53411946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 11 Feb 2020 15:49:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27AD9A4051;
	Tue, 11 Feb 2020 15:49:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA2DA404D;
	Tue, 11 Feb 2020 15:49:55 +0000 (GMT)
Received: from thinkpad (unknown [9.152.96.111])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2020 15:49:55 +0000 (GMT)
Date: Tue, 11 Feb 2020 16:49:54 +0100
From: Gerald Schaefer <gerald.schaefer@de.ibm.com>
To: Vivek Goyal <vgoyal@redhat.com>
In-Reply-To: <20200211151114.GA8590@redhat.com>
References: <20200207202652.1439-1-vgoyal@redhat.com>
	<20200207202652.1439-5-vgoyal@redhat.com>
	<20200210215315.27b7e310@thinkpad>
	<20200211151114.GA8590@redhat.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20021115-0008-0000-0000-00000351EC9C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021115-0009-0000-0000-00004A728E57
Message-Id: <20200211164954.4df79b8b@thinkpad>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
	definitions=2020-02-11_04:2020-02-10,
	2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0 spamscore=0
	lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999
	mlxscore=0
	malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
	bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002110114
X-MC-Unique: 4zfBSHO_MS-bjywY46Eh-g-1
X-MC-Unique: 9s_tLrUGNeKbyg8zG0WBrw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01BFqXvp007492
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: linux-s390@vger.kernel.org, linux-nvdimm@lists.01.org,
	vishal.l.verma@intel.com, hch@infradead.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v3 4/7] s390, dcssblk,
 dax: Add dax zero_page_range operation to dcssblk driver
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

On Tue, 11 Feb 2020 10:11:14 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Mon, Feb 10, 2020 at 09:53:15PM +0100, Gerald Schaefer wrote:
> > On Fri,  7 Feb 2020 15:26:49 -0500
> > Vivek Goyal <vgoyal@redhat.com> wrote:
> > 
> > > Add dax operation zero_page_range for dcssblk driver.
> > > 
> > > CC: linux-s390@vger.kernel.org
> > > Suggested-by: Christoph Hellwig <hch@infradead.org>
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  drivers/s390/block/dcssblk.c | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> > > index 63502ca537eb..331abab5d066 100644
> > > --- a/drivers/s390/block/dcssblk.c
> > > +++ b/drivers/s390/block/dcssblk.c
> > > @@ -57,11 +57,28 @@ static size_t dcssblk_dax_copy_to_iter(struct dax_device *dax_dev,
> > >  	return copy_to_iter(addr, bytes, i);
> > >  }
> > >  
> > > +static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev, u64 offset,
> > > +				       size_t len)
> > > +{
> > > +	long rc;
> > > +	void *kaddr;
> > > +	pgoff_t pgoff = offset >> PAGE_SHIFT;
> > > +	unsigned page_offset = offset_in_page(offset);
> > > +
> > > +	rc = dax_direct_access(dax_dev, pgoff, 1, &kaddr, NULL);
> > 
> > Why do you pass only 1 page as nr_pages argument for dax_direct_access()?
> > In some other patch in this series there is a comment that this will
> > currently only be used for one page, but support for more pages might be
> > added later. Wouldn't it make sense to rather use something like
> > PAGE_ALIGN(page_offset + len) >> PAGE_SHIFT instead of 1 here, so that
> > this won't have to be changed when callers will be ready to use it
> > with more than one page?
> > 
> > Of course, I guess then we'd also need some check on the return value
> > from dax_direct_access(), i.e. if the returned available range is
> > large enough for the requested range.
> 
> I left it at 1 page because that's the current limitation of this
> interface and there are no callers which are zeroing across page
> boundaries.
> 
> I prefer to keep it this way and modify it when we are extending this
> interface to allow zeroing across page boundaries. Because even if I add
> that logic, I can't test it.

OK, fine with me.

Reviewed-by: Gerald Schaefer <gerald.schaefer@de.ibm.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

