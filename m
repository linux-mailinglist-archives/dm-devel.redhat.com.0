Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6261363603B
	for <lists+dm-devel@lfdr.de>; Wed, 23 Nov 2022 14:43:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669211024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9swZEzIl6q2cpSYMlK+unVAL0TAAQu3uFRxAxJQp8kA=;
	b=e8JGpLmV0EW+EwsSV2In4LN5e2UVfRXT1Yv8CyU7VPJahsn4xDn8rQcruj3Qze0+GyO83K
	RyZcoO9d5EyxBHcgiKnCVo6GHipL+BCWpJJuqMTpMCROtF+zefT/QX1f/NNsawsww6LSEf
	foylxYlp4AfoN7/3A01h3tyXCctax9I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-8yTzH5afMJqJE_wsCBLJRw-1; Wed, 23 Nov 2022 08:43:42 -0500
X-MC-Unique: 8yTzH5afMJqJE_wsCBLJRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A001C05129;
	Wed, 23 Nov 2022 13:43:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B518C2023A16;
	Wed, 23 Nov 2022 13:43:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 095A819465A3;
	Wed, 23 Nov 2022 13:43:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B7B0D1946587
 for <dm-devel@listman.corp.redhat.com>; Wed, 23 Nov 2022 12:14:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9673C200B40B; Wed, 23 Nov 2022 12:14:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED942024CBE
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 12:14:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B42A85A588
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 12:14:05 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-OqBCWG_-OMSJ2JLF84a4Hg-1; Wed, 23 Nov 2022 07:13:58 -0500
X-MC-Unique: OqBCWG_-OMSJ2JLF84a4Hg-1
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20221123121355epoutp045c44c4448b3634ef30d4b02082ab8cb4~qNa6BcRB11743217432epoutp04F
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 12:13:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20221123121355epoutp045c44c4448b3634ef30d4b02082ab8cb4~qNa6BcRB11743217432epoutp04F
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20221123121354epcas5p3c4a880738c02eec4d1b85ab65c092ebe~qNa5VKSZR0081800818epcas5p3c;
 Wed, 23 Nov 2022 12:13:54 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4NHKmJ22P4z4x9Pv; Wed, 23 Nov
 2022 12:13:52 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.3C.56352.08E0E736; Wed, 23 Nov 2022 21:13:52 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20221123102436epcas5p45ed06bc94371fec331b80092a08f9400~qL7dLMNGh2898328983epcas5p4e;
 Wed, 23 Nov 2022 10:24:36 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221123102436epsmtrp2062cf8c710f11bf976af04339696e547~qL7dI2e__2330723307epsmtrp2d;
 Wed, 23 Nov 2022 10:24:36 +0000 (GMT)
X-AuditID: b6c32a4b-5f7fe7000001dc20-e1-637e0e80291b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 79.8F.18644.4E4FD736; Wed, 23 Nov 2022 19:24:36 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20221123102432epsmtip25b864b9a404b9e21b1160635842d1ca1~qL7aGUOYX2006520065epsmtip2f;
 Wed, 23 Nov 2022 10:24:32 +0000 (GMT)
Date: Wed, 23 Nov 2022 15:43:13 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20221123101313.GB26377@test-zns>
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxhMX9MF0+6DD7NO5QzqDRwESkhiY5f9CB7DXFVa22Za+w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0xbZRjH8562p4UIHG7yUtyGBZ0wLkVa9uIAl0DcUZiy+MFEo6yhJ0Ao
 7VlbYOCylUGdsiBDWIKVcRlsc5SLlroVsIxUoYAiCw1MQIZggchVxsQwgrNwwOzb7/0//yfP
 LS+P5VHB5fMy5GpKKZfIBLgz+84PQUGhGtfzqcLmhxzUOtDLQvdb9ABdvLLNQvrJUhxtDQ6x
 kHnlKw4a627H0G19D4Y669Yw1PN0GUfTj8fZ6AvLKECzIzoMmcePoO/N/Wxk66jCUc3NWS4q
 s7ZxkMleAND6jSIuallcZaO+cT80tG3lHPchdVODONmum+SSQw+/ZZO2wWzS0PgZTrY1XCA7
 xzQ4WVK44jBopzjkatcITn5ubATkuuEgean7MkYa7MtYsuv7mTHplERKKf0peapCmiFPixUk
 vpsSnyKOEkaERkSjowJ/uSSLihUkJCWHvpEhc8wv8M+RyLIdUrJEpRKEx8UoFdlqyj9doVLH
 CihaKqNFdJhKkqXKlqeFySn1axFC4atih/F0Znrh3UUuXZB8drB5jKUBT8TFwIkHCRGsX/4Z
 22EPohPAuw1EMXB28CMAzdo1DvNYB/DP9mbWfoa2t4TNZHQAqNF9wJjmAOwr39wNsImX4PDa
 b6AY8Hg4cQT+9JS3I3sRh2HT1Y1dC4vQsOHsGLHDnkQitF3Uc3fYhQiFul+2AcPusP9L+67f
 iTgFS4uKd3vwJgJg9x0rtlMXEm1O0HJtBGeaS4DTddMchj3hgtXIZZgP11fMe55ceLvia5xJ
 LgJQ90AHmMDrUDtQymK6S4eL+mGM0Q/AqwMtGKO7wpIt+57uAk3V+xwAm1pr9wr4wtF/CvaY
 hFMTJsBs6BIGNzbq2VfAId0z0+meqcdwCKztfITrHMtjEX7w1r88BoNga0d4LeA0Al+KVmWl
 USoxHSmncv8/eKoiywB2v0dwognM/P5XmAVgPGABkMcSeLlcePNcqoeLVJKXTykVKcpsGaWy
 ALHjWGUsvneqwvG/5OqUCFG0UBQVFSWKjoyKEPi41FcGp3oQaRI1lUlRNKXcz8N4TnwNdmLu
 Xl5gTv6S4bncUz7O2Stpfm1uM+c+zTLKTpbP3xB3tfWJLz/f+46bR1PZhEJotL/YYKrsd81T
 rlgCb52Jp78zeX+y9OT0R53THQveVeXzo9PW9BfWAg4HYhsJjyXjtPuxum/ca1KSNiuNLXY3
 bWiX4Z7F52blieT8Xtr41pnrngPSAzptwPGY+8oe23tb/t3hOO2bN2PwzDlPlWnn37YX/4E2
 h7dk/id/NNMVW4Uh286Dk8d+5dWEG7xWzat1KnV1ysGQ0uAp8lDG32edq8NenrMh+3rrRtXM
 5kQxf2YiTgSOzizZPly47iON579SEKbPF8Q55WU+sEZ+fC02iRawVemSiGCWUiX5D4bzlVan
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsWy7bCSvO6TL7XJBhOWsFisP3WM2eLCutWM
 Fk0T/jJbrL7bz2bx++x5Zou972azWtw8sJPJYuXqo0wWuxd+ZLI4+v8tm8XDL7dYLCYdusZo
 8fTqLCaLvbe0LfbsPclicXnXHDaL+cuesltMPL6Z1WLHk0ZGi89LW9gt1r1+z2Jx4pa0xfm/
 x1kdxD1m3T/L5rFz1l12j/P3NrJ4XD5b6rFpVSebx+Yl9R67bzawefQ2vwMqaL3P6vF+31U2
 j74tqxg9Pm+S82g/0M3ksenJW6YAvigum5TUnMyy1CJ9uwSujG2zmpkLDvpWTJ/3gaWB8bJx
 FyMnh4SAiUTrsV6WLkYuDiGBHYwSb69sZIJISEos+3uEGcIWllj57zk7RNETRol73bdYQRIs
 AqoSlz7eYexi5OBgE9CWOP2fAyQsIqAusWbqN7ChzAJNLBLzrt1mA0kIC3hLXG5azQ5i8wro
 Ssw695cRYmg7k8Si9StYIRKCEidnPmEBsZkFtCRu/HvJBLKAWUBaYvk/sAWcAoES/S1dYMeJ
 CihLHNh2nGkCo+AsJN2zkHTPQuhewMi8ilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMj
 OO61tHYw7ln1Qe8QIxMH4yFGCQ5mJRHees+aZCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pO
 xgsJpCeWpGanphakFsFkmTg4pRqYpM7l/3Z+sEWYv3Zn1/8Tb0Lqsw7cn/f6wQ9z7n+xN+YE
 ShvMSHecIZT2c/aJwLv3a4ptbFjear86UM8SnrovZG/eqeD1Kx8+2uFW3TLpuNTZ00xTtP5F
 SWpINz9l+b1lZdyh0Nub9m1o5uubZ5D1u4A7fanuJJuNLyeZ3DItLnXt/aIe2s+p+s+7/pag
 5SyrS2y1mi/CZv5cPW3nVvY1/etUvdr97/HPy1793jgpNi0t4Prh2Veb1Ze913iclF46o31u
 kPWltlcb2BYZFF26Gxt8vYWvJrKMb8feCK2EeWs7jwUVzkxYlJ4pnDD/wxWdP9s3MWXwXot7
 sk2XU/nW8TwVtTv3XXyCW3cl/GufoMRSnJFoqMVcVJwIAH3sjhpqAwAA
X-CMS-MailID: 20221123102436epcas5p45ed06bc94371fec331b80092a08f9400
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221123061044epcas5p2ac082a91fc8197821f29e84278b6203c
References: <CGME20221123061044epcas5p2ac082a91fc8197821f29e84278b6203c@epcas5p2.samsung.com>
 <20221123055827.26996-1-nj.shetty@samsung.com>
 <20221123055827.26996-11-nj.shetty@samsung.com>
 <CAOQ4uxhMX9MF0+6DD7NO5QzqDRwESkhiY5f9CB7DXFVa22Za+w@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 23 Nov 2022 13:14:48 +0000
Subject: Re: [dm-devel] [PATCH v5 10/10] fs: add support for copy file range
 in zonefs
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-nvme@lists.infradead.org, dm-devel@redhat.com, hch@lst.de,
 agk@redhat.com, naohiro.aota@wdc.com, sagi@grimberg.me, gost.dev@samsung.com,
 damien.lemoal@opensource.wdc.com, james.smart@broadcom.com,
 p.raghav@samsung.com, kch@nvidia.com, anuj20.g@samsung.com, snitzer@kernel.org,
 linux-block@vger.kernel.org, viro@zeniv.linux.org.uk, kbusch@kernel.org,
 axboe@kernel.dk, joshi.k@samsung.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jth@kernel.org, nitheshshetty@gmail.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="----GsYAgckb8ZPIB7TqR4NYyp-jgnPv5c.LE-kW9H5hDU_d1TDU=_664b6_"

------GsYAgckb8ZPIB7TqR4NYyp-jgnPv5c.LE-kW9H5hDU_d1TDU=_664b6_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 23, 2022 at 08:53:14AM +0200, Amir Goldstein wrote:
> On Wed, Nov 23, 2022 at 8:26 AM Nitesh Shetty <nj.shetty@samsung.com> wrote:
> >
> > copy_file_range is implemented using copy offload,
> > copy offloading to device is always enabled.
> > To disable copy offloading mount with "no_copy_offload" mount option.
> > At present copy offload is only used, if the source and destination files
> > are on same block device, otherwise copy file range is completed by
> > generic copy file range.
> >
> > copy file range implemented as following:
> >         - write pending writes on the src and dest files
> >         - drop page cache for dest file if its conv zone
> >         - copy the range using offload
> >         - update dest file info
> >
> > For all failure cases we fallback to generic file copy range
> > At present this implementation does not support conv aggregation
> >
> > Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> > Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
> > ---
> >  fs/zonefs/super.c | 179 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 179 insertions(+)
> >
> > diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> > index abc9a85106f2..15613433d4ae 100644
> > --- a/fs/zonefs/super.c
> > +++ b/fs/zonefs/super.c
> > @@ -1223,6 +1223,183 @@ static int zonefs_file_release(struct inode *inode, struct file *file)
> >         return 0;
> >  }
> >
> > +static int zonefs_is_file_copy_offset_ok(struct inode *src_inode,
> > +               struct inode *dst_inode, loff_t src_off, loff_t dst_off,
> > +               size_t *len)
> > +{
> > +       loff_t size, endoff;
> > +       struct zonefs_inode_info *dst_zi = ZONEFS_I(dst_inode);
> > +
> > +       inode_lock(src_inode);
> > +       size = i_size_read(src_inode);
> > +       inode_unlock(src_inode);
> > +       /* Don't copy beyond source file EOF. */
> > +       if (src_off < size) {
> > +               if (src_off + *len > size)
> > +                       *len = (size - (src_off + *len));
> > +       } else
> > +               *len = 0;
> > +
> > +       mutex_lock(&dst_zi->i_truncate_mutex);
> > +       if (dst_zi->i_ztype == ZONEFS_ZTYPE_SEQ) {
> > +               if (*len > dst_zi->i_max_size - dst_zi->i_wpoffset)
> > +                       *len -= dst_zi->i_max_size - dst_zi->i_wpoffset;
> > +
> > +               if (dst_off != dst_zi->i_wpoffset)
> > +                       goto err;
> > +       }
> > +       mutex_unlock(&dst_zi->i_truncate_mutex);
> > +
> > +       endoff = dst_off + *len;
> > +       inode_lock(dst_inode);
> > +       if (endoff > dst_zi->i_max_size ||
> > +                       inode_newsize_ok(dst_inode, endoff)) {
> > +               inode_unlock(dst_inode);
> > +               goto err;
> > +       }
> > +       inode_unlock(dst_inode);
> > +
> > +       return 0;
> > +err:
> > +       mutex_unlock(&dst_zi->i_truncate_mutex);
> > +       return -EINVAL;
> > +}
> > +
> > +static ssize_t zonefs_issue_copy(struct zonefs_inode_info *src_zi,
> > +               loff_t src_off, struct zonefs_inode_info *dst_zi,
> > +               loff_t dst_off, size_t len)
> > +{
> > +       struct block_device *src_bdev = src_zi->i_vnode.i_sb->s_bdev;
> > +       struct block_device *dst_bdev = dst_zi->i_vnode.i_sb->s_bdev;
> > +       struct range_entry *rlist = NULL;
> > +       int ret = len;
> > +
> > +       rlist = kmalloc(sizeof(*rlist), GFP_KERNEL);
> > +       if (!rlist)
> > +               return -ENOMEM;
> > +
> > +       rlist[0].dst = (dst_zi->i_zsector << SECTOR_SHIFT) + dst_off;
> > +       rlist[0].src = (src_zi->i_zsector << SECTOR_SHIFT) + src_off;
> > +       rlist[0].len = len;
> > +       rlist[0].comp_len = 0;
> > +       ret = blkdev_issue_copy(src_bdev, dst_bdev, rlist, 1, NULL, NULL,
> > +                       GFP_KERNEL);
> > +       if (rlist[0].comp_len > 0)
> > +               ret = rlist[0].comp_len;
> > +       kfree(rlist);
> > +
> > +       return ret;
> > +}
> > +
> > +/* Returns length of possible copy, else returns error */
> > +static ssize_t zonefs_copy_file_checks(struct file *src_file, loff_t src_off,
> > +                                       struct file *dst_file, loff_t dst_off,
> > +                                       size_t *len, unsigned int flags)
> > +{
> > +       struct inode *src_inode = file_inode(src_file);
> > +       struct inode *dst_inode = file_inode(dst_file);
> > +       struct zonefs_inode_info *src_zi = ZONEFS_I(src_inode);
> > +       struct zonefs_inode_info *dst_zi = ZONEFS_I(dst_inode);
> > +       ssize_t ret;
> > +
> > +       if (src_inode->i_sb != dst_inode->i_sb)
> > +               return -EXDEV;
> > +
> > +       /* Start by sync'ing the source and destination files for conv zones */
> > +       if (src_zi->i_ztype == ZONEFS_ZTYPE_CNV) {
> > +               ret = file_write_and_wait_range(src_file, src_off,
> > +                               (src_off + *len));
> > +               if (ret < 0)
> > +                       goto io_error;
> > +       }
> > +       inode_dio_wait(src_inode);
> > +
> > +       /* Start by sync'ing the source and destination files ifor conv zones */
> > +       if (dst_zi->i_ztype == ZONEFS_ZTYPE_CNV) {
> > +               ret = file_write_and_wait_range(dst_file, dst_off,
> > +                               (dst_off + *len));
> > +               if (ret < 0)
> > +                       goto io_error;
> > +       }
> > +       inode_dio_wait(dst_inode);
> > +
> > +       /* Drop dst file cached pages for a conv zone*/
> > +       if (dst_zi->i_ztype == ZONEFS_ZTYPE_CNV) {
> > +               ret = invalidate_inode_pages2_range(dst_inode->i_mapping,
> > +                               dst_off >> PAGE_SHIFT,
> > +                               (dst_off + *len) >> PAGE_SHIFT);
> > +               if (ret < 0)
> > +                       goto io_error;
> > +       }
> > +
> > +       ret = zonefs_is_file_copy_offset_ok(src_inode, dst_inode, src_off,
> > +                       dst_off, len);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       return *len;
> > +
> > +io_error:
> > +       zonefs_io_error(dst_inode, true);
> > +       return ret;
> > +}
> > +
> > +static ssize_t zonefs_copy_file(struct file *src_file, loff_t src_off,
> > +               struct file *dst_file, loff_t dst_off,
> > +               size_t len, unsigned int flags)
> > +{
> > +       struct inode *src_inode = file_inode(src_file);
> > +       struct inode *dst_inode = file_inode(dst_file);
> > +       struct zonefs_inode_info *src_zi = ZONEFS_I(src_inode);
> > +       struct zonefs_inode_info *dst_zi = ZONEFS_I(dst_inode);
> > +       ssize_t ret = 0, bytes;
> > +
> > +       inode_lock(src_inode);
> > +       inode_lock(dst_inode);
> > +       bytes = zonefs_issue_copy(src_zi, src_off, dst_zi, dst_off, len);
> > +       if (bytes < 0)
> > +               goto unlock_exit;
> > +
> > +       ret += bytes;
> > +
> > +       file_update_time(dst_file);
> > +       mutex_lock(&dst_zi->i_truncate_mutex);
> > +       zonefs_update_stats(dst_inode, dst_off + bytes);
> > +       zonefs_i_size_write(dst_inode, dst_off + bytes);
> > +       dst_zi->i_wpoffset += bytes;
> > +       mutex_unlock(&dst_zi->i_truncate_mutex);
> > +       /* if we still have some bytes left, do splice copy */
> > +       if (bytes && (bytes < len)) {
> > +               bytes = do_splice_direct(src_file, &src_off, dst_file,
> > +                                        &dst_off, len, flags);
> > +               if (bytes > 0)
> > +                       ret += bytes;
> > +       }
> > +unlock_exit:
> > +       if (ret < 0)
> > +               zonefs_io_error(dst_inode, true);
> > +       inode_unlock(src_inode);
> > +       inode_unlock(dst_inode);
> > +       return ret;
> > +}
> > +
> > +static ssize_t zonefs_copy_file_range(struct file *src_file, loff_t src_off,
> > +                                     struct file *dst_file, loff_t dst_off,
> > +                                     size_t len, unsigned int flags)
> > +{
> > +       ssize_t ret = -EIO;
> > +
> > +       ret = zonefs_copy_file_checks(src_file, src_off, dst_file, dst_off,
> > +                                    &len, flags);
> > +       if (ret > 0)
> > +               ret = zonefs_copy_file(src_file, src_off, dst_file, dst_off,
> > +                                    len, flags);
> > +       else if (ret < 0 && ret == -EXDEV)
> 
> First of all, ret < 0 is redundant.
> 

acked

> > +               ret = generic_copy_file_range(src_file, src_off, dst_file,
> > +                                             dst_off, len, flags);
> 
> But more importantly, why do you want to fall back to
> do_splice_direct() in zonefs copy_file_range?
> How does it serve your patch set or the prospect consumers
> of zonefs copy_file_range?
> 
> The reason I am asking is because commit 5dae222a5ff0
> ("vfs: allow copy_file_range to copy across devices")
> turned out to be an API mistake that was later reverted by
> 868f9f2f8e00 ("vfs: fix copy_file_range() regression in cross-fs copies")
> 
> It is always better to return EXDEV to userspace which can
> always fallback to splice itself, but maybe it has something
> smarter to do.
> 
> The places where it made sense for kernel to fallback to
> direct splice was for network servers server-side-copy, but that
> is independent of any specific filesystem copy_file_range()
> implementation.
> 
> Thanks,
> Amir.
> 

At present we don't handle few case's such as IO getting split incase of
copy offload, so we wanted to fallback to existing mechanism. So went with
default operation, do_splice_direct.

Regards,
Nitesh Shetty


------GsYAgckb8ZPIB7TqR4NYyp-jgnPv5c.LE-kW9H5hDU_d1TDU=_664b6_
Content-Type: text/plain; charset="utf-8"


------GsYAgckb8ZPIB7TqR4NYyp-jgnPv5c.LE-kW9H5hDU_d1TDU=_664b6_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

------GsYAgckb8ZPIB7TqR4NYyp-jgnPv5c.LE-kW9H5hDU_d1TDU=_664b6_--

